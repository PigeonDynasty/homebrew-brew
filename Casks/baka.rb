cask "baka" do
  version "5.2.4+1101"

  on_arm do
    sha256 "894bff07ddf0f54b4572d8dc428e72befb6e4208cdeee058d4d6776a8fe623df"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "ef434f6ca7836648ca5aa43bdb3b60e988f9f5d00341d577723f17d189cc020e"

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
