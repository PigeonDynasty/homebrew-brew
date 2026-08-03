cask "baka" do
  version "5.0.3+0727"
          
  on_arm do
    sha256 "95706c4b597278fd8c6e4676d1f04e656da6213ea63c47fc338a013899087a4d"
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg",
        verified: "https://github.com/AniBakaBaka/AniBaka"
  end

  on_intel do
    sha256 "4ad87cc42af4c1155475017de2c2c8242c953bbece266ab62070ab812c48df31"
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-x86_64.dmg",
        verified: "https://github.com/AniBakaBaka/AniBaka"
  end
  
  livecheck do
    url :url
  end

  auto_updates true

  name "anibaka"
  desc "一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。"
  homepage "https://ani-baka.vercel.app"

  depends_on macos: :catalina

  app "Baka.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", 
           "/Applications/Baka.app"
  end
         
  caveats "postflight script already executed quarantine removal."
  
end
