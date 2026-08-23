cask "mrrss" do
  version "v1.3.27"
  sha256 "b8011b5ddeedd1a3a4f57bec6ba3d724827822efe08815d4549399e2b8625b37"
          
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
