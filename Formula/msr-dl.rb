class MsrDl < Formula
  include Language::Python::Virtualenv

  desc "Download Monster Siren albums with metadata and synchronized lyrics"
  homepage "https://github.com/tsuru-kiri/msr-dl"
  url "https://github.com/tsuru-kiri/msr-dl/releases/download/v0.1.4/msr_dl-0.1.4.tar.gz"
  version "0.1.4"
  sha256 "b82a6ad32c17b7002785f853548f0012aed6c8016f093e342bcd085c27f25837"

  depends_on "ffmpeg"
  depends_on :macos
  depends_on "pillow" => :no_linkage
  depends_on "python@3.13"

  pypi_packages exclude_packages: "pillow"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83/charset_normalizer-3.5.1.tar.gz"
    sha256 "6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/df/70/1675da133ea92227da41bf5b24e1c66be597ff736a1533ade41da986852f/mutagen-1.48.1.tar.gz"
    sha256 "8f95637ab9f6f305cec6bd1294e197debe207998e3e068596563c74f86b0a173"
  end

  resource "pylrc" do
    url "https://files.pythonhosted.org/packages/09/11/eff2a73a32b204ab040811f5a966f9342960f8c889af2bb20e544640b630/pylrc-0.1.2.tar.gz"
    sha256 "b9d6a07b7d211f71299b3faea5a1ca64c2fc45e3d704227c07ccdb0cc09386d1"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "msr-dl #{version}", shell_output("#{bin}/msr-dl --version")
  end
end
