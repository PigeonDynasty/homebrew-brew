cask "mrrss" do
  on_system :catalina, :or_newer do
  version "v1.3.38"
  end
  sha256 "69e8c91c96dc7fc7407197dbc8e74c827f89e66a1aa24dc50c257da1632f93b5"

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
    run "xattr",
        args: ["-r", "-d", "com.apple.quarantine",
               "/Applications/MrRSS.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
