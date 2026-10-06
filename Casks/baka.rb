cask "baka" do
  version "5.2.0+1001"

  on_arm do
    sha256 "a6a5f429592d1ded3dff07578e2218329275f5ea4a79798e2e0ca47a1a8598ed"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "f9965a89bbae948d30e2dc1bd6b182738a5a6f39a1be5db44c6bfbe007cb01c1"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-x86_64.dmg"
  end

  name "anibaka"
  desc "一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。"
  homepage "https://ani-baka.vercel.app/"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on :macos

  app "Baka.app"

  postflight_steps do
    run "xattr",
        args: ["-r", "-d", "com.apple.quarantine",
               "/Applications/Baka.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
