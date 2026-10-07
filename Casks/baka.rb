cask "baka" do
  version "5.2.1+1007"

  on_arm do
    sha256 "92205fc7e55d9066d637497fb99c8ad69bb135a43f90c568773b18757678d0d9"

    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "59cd0e3127dd0076d3ac4cdd15afa125fe5f3ef5cff8b960c65630634475773f"

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
