cask "mrrss" do
  version "v1.3.25"
  sha256 "72907dad25abfb6627c8352ad7f250d81a27fe3d57847689ce2d59d4bb6b62f1"
          
  on_macos do
    clean_version = version.sub(/^v/, "")
    url "https://github.com/WCY-dt/MrRSS/releases/download/#{version}/MrRSS-#{clean_version}-darwin-universal.dmg",
        verified: "https://github.com/WCY-dt/MrRSS"
  end
  
  livecheck do
    url :url
  end

  auto_updates true

  name "MrRSS"
  desc "A modern, cross-platform, and free AI RSS reader. 一个现代化、跨平台且免费的 AI RSS 阅读器."
  homepage "https://mrrss.ch3nyang.top/"

  depends_on macos: :catalina

  app "MrRSS.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", 
           "/Applications/MrRSS.app"
  end
         
  caveats "postflight script already executed quarantine removal."
  
end
