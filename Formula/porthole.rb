class Porthole < Formula
  include Language::Python::Shebang

  desc "Open a browser window through another region without a system VPN"
  homepage "https://ashutosh091.github.io/porthole"
  url "https://github.com/ashutosh091/porthole/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ce2a86a2e11ea063aba4bf163604af1a5b5db75ef75f8fe8a89acb241793f7b1"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    rewrite_shebang detected_python_shebang, "porthole"
    bin.install "porthole"
    pkgshare.install "profiles.example.toml"
  end

  def caveats
    <<~EOS
      Create your profiles from the example:
        mkdir -p ~/.config/porthole/secrets
        cp #{opt_pkgshare}/profiles.example.toml ~/.config/porthole/profiles.toml
      Profiles that use gluetun need Docker Desktop running.
    EOS
  end

  test do
    assert_match "usage: porthole", shell_output("#{bin}/porthole -h")
    (testpath/"profiles.toml").write <<~EOS
      [profile.us]
      type = "ssh"
      host = "example.com"
      port = 1081
    EOS
    with_env(PORTHOLE_CONFIG: testpath/"profiles.toml", PORTHOLE_HOME: testpath/"state") do
      assert_match "us", shell_output("#{bin}/porthole list")
    end
  end
end
