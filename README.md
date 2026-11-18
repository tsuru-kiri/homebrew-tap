# Homebrew tap

Homebrew formulae maintained by [tsuru-kiri](https://github.com/tsuru-kiri).

## Formulae

| Formula | Description |
| --- | --- |
| `ente-cli` | Ente's new CLI for terminals and agents (supersedes the outdated `homebrew/core` formula) |
| `msr-dl` | Download Monster Siren albums with metadata and synchronized lyrics |

Install a formula directly from this tap:

```bash
brew install tsuru-kiri/tap/msr-dl
```

Alternatively, add the tap first:

```bash
brew tap tsuru-kiri/tap
brew install msr-dl
```

### `ente-cli`

`homebrew/core` also ships an `ente-cli` formula, but it is stuck on the previous Go-based CLI (0.3.x).
This tap packages the new Rust-based CLI released as `ente-cli-v*` on [ente/ente](https://github.com/ente/ente/releases).
Commands have changed; see the [migration guide](https://ente.com/help/cli/migration) before switching.

Always install it with the fully qualified name, otherwise Homebrew picks the core formula:

```bash
brew uninstall ente-cli   # only if the core version is installed
brew install tsuru-kiri/tap/ente-cli
```

Homebrew tap
