cask "baka" do
  version "5.2.5+261113"

  on_arm do
    sha256 "21649e1e7fc3c6fe9903803c3e7f4e8aae43a0ff4593238780f71765200a7163"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "c2c1316d1cbcfdf4e885bd2bd40ab2c05f62e43c8b6ac33e8f1d88b6f2143f7c"

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
