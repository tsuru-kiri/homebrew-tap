#!/usr/bin/env bash
# Bump the ente-cli formula to the latest ente-cli release of ente/ente.
# Usage: update-ente-cli.sh [formula]   (requires gh with a token)
set -euo pipefail

formula="${1:-Formula/ente-cli.rb}"
repo="ente/ente"

current=$(sed -nE 's/^  version "([^"]+)"$/\1/p' "$formula")
latest=$(gh release list -R "$repo" --limit 200 --exclude-drafts --exclude-pre-releases \
  --json tagName --jq '.[].tagName | select(test("^ente-cli-v[0-9]+(\\.[0-9]+)+$")) | ltrimstr("ente-cli-v")' |
  sort -V | tail -n1)

if [[ -z "$current" || -z "$latest" ]]; then
  echo "::error::could not determine versions (current='$current', latest='$latest')" >&2
  exit 1
fi
if [[ "$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -n1)" == "$current" ]]; then
  echo "ente-cli is up to date ($current)"
  exit 0
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
gh release download "ente-cli-v$latest" -R "$repo" -p SHA256SUMS -D "$tmp"

# Rewrite version and the sha256 following each asset url; expect exactly 4 assets.
awk -v ver="$latest" '
  NR == FNR { sub(/^\*/, "", $2); hash[$2] = $1; next }
  /^  version "/ { sub(/"[^"]+"/, "\"" ver "\"") }
  match($0, /-(macos|linux)-(arm64|amd64)\.tar\.gz/) { asset = "ente-cli-v" ver substr($0, RSTART, RLENGTH) }
  /^ *sha256 "/ && asset != "" {
    if (!(asset in hash)) { print "missing checksum for " asset > "/dev/stderr"; failed = 1; exit 1 }
    sub(/"[0-9a-f]+"/, "\"" hash[asset] "\""); asset = ""; updated++
  }
  { print }
  END {
    if (failed) exit 1
    if (updated != 4) { print "expected 4 checksums, updated " updated + 0 > "/dev/stderr"; exit 1 }
  }
' "$tmp/SHA256SUMS" "$formula" >"$tmp/formula.rb"
mv "$tmp/formula.rb" "$formula"

echo "ente-cli bumped $current -> $latest"
if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  echo "version=$latest" >>"$GITHUB_OUTPUT"
fi
