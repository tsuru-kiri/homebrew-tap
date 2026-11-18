class EnteCli < Formula
  desc "Ente's new CLI for terminals and agents"
  homepage "https://ente.com/help/cli/"
  version "0.4.4"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    regex(/^ente-cli-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-macos-arm64.tar.gz"
      sha256 "df4c3da7fdf120d71b33bb10a0a8015bbac67a6669f303ecf887f7045c51d47f"
    end
    on_intel do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-macos-amd64.tar.gz"
      sha256 "d5df84f305b4b61901c946a57cc96d3296eb8e0d47911897da9f4331bb028ff6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-linux-arm64.tar.gz"
      sha256 "c51e5ece5617ad7bb4cf6148c6a58b4364db448f7b1594c00b250efc88e40735"
    end
    on_intel do
      url "https://github.com/ente/ente/releases/download/ente-cli-v#{version}/ente-cli-v#{version}-linux-amd64.tar.gz"
      sha256 "719834d6b65e9e48a4a1d4e3e577247633f0e8a5eb2bae30278ec6c6fc536f17"
    end
  end

  def install
    bin.install "ente"
  end

  test do
    assert_equal "ente #{version}", shell_output("#{bin}/ente --version").strip
  end
end
