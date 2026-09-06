cask "baka" do
  version "5.1.0+0823"

  on_arm do
    sha256 "fca24464621c3e1c7b001a547010e7818883349ea69436c75273760d4b636a1f"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "000b3894403fce2178c3f8b24c6550ba2121ca0858cb44e3319e92da44765176"

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
    run "sudo",
        args: ["xattr", "-r", "-d", "com.apple.quarantine",
               "/Applications/Baka.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
