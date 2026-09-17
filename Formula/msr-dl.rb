class MsrDl < Formula
  desc "Download Monster Siren albums with metadata and synchronized lyrics"
  homepage "https://github.com/tsuru-kiri/msr-dl"
  url "https://github.com/tsuru-kiri/msr-dl/releases/download/v0.1.1/msr-dl-v0.1.1-macos-ARM64.tar.gz"
  version "0.1.1"
  sha256 "b68386d6171050e6e080abed4d65d0d3f0ae4cb94f77ea47df06f8c8c60f0ffe"

  depends_on arch: :arm64
  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "msr-dl"
  end

  test do
    assert_match "msr-dl #{version}", shell_output("#{bin}/msr-dl --version")
  end
end
