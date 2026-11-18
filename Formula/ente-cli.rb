class EnteCli < Formula
  desc "Ente's new CLI for terminals and agents"
  homepage "https://ente.com/help/cli/"
  version "0.4.5"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    regex(/^ente-cli-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-macos-arm64.tar.gz"
      sha256 "36606ae6d9713d4b9768713a58b5f0be1e6f55a804aa9ff47ab2c2c81d0c4219"
    end
    on_intel do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-macos-amd64.tar.gz"
      sha256 "8d416f09d683411e8d12ac4ff3cf287bfb6426353847eab6c4378b0aebc1bbca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "721ad071c8a4aba138b6132cf13bbd30800d68ce4f29711d259e492236c2810c"
    end
    on_intel do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "4890dc2b27510d0e2f9e7ee5d47bf1f274e145f79d5557aef1d24b3103fadbbe"
    end
  end

  def install
    bin.install "ente"
  end

  test do
    assert_equal "ente #{version}", shell_output("#{bin}/ente --version").strip
  end
end
