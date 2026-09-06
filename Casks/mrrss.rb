cask "mrrss" do
  on_system :catalina, :or_newer do
    version "v1.3.28"
  end
  sha256 "7f178a6d0cb2741a4bae85b058313ca4f4946c103c3c34625630f70f6f8e286a"

  on_macos do
    clean_version = version.sub(/^v/, "")
    url "https://github.com/WCY-dt/MrRSS/releases/download/#{version}/MrRSS-#{clean_version}-darwin-universal.dmg"
  end

  name "MrRSS"
  desc "Modern, cross-platform, and free AI RSS reader. 一个现代化、跨平台且免费的 AI RSS 阅读器"
  homepage "https://mrrss.ch3nyang.top/"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on :macos

  app "MrRSS.app"

  postflight_steps do
    run "sudo",
        args: ["xattr", "-r", "-d", "com.apple.quarantine",
               "/Applications/MrRSS.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
