cask "porthole-app" do
  version "0.1.1"
  sha256 "b9d1abc27b8a108b918bf8cf3186a6bf62af93557c547c837c4050248dc22396"

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
