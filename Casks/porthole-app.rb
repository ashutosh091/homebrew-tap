cask "porthole-app" do
  version "0.1.0"
  sha256 "b4974d4387625a28ae4c0e1bab3bc85299ad11a08aeea33abf51ed6d2b88513f"

  url "https://github.com/ashutosh091/porthole/releases/download/v#{version}/Porthole-macos.dmg"
  name "Porthole"
  desc "Menu bar app that opens a browser window through another region"
  homepage "https://ashutosh091.github.io/porthole"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Porthole.app"

  uninstall quit: "io.github.ashutosh091.porthole"

  zap trash: "~/Library/Preferences/io.github.ashutosh091.porthole.plist"
end
