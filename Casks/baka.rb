cask "baka" do
  version "5.0.0+0624"
  sha256 "1643a1dc8ca50d365c9ccb95561f8140a4a46a2bd6b700c95049431b9483f04f"
          
  on_macos do
    version_major, build = version.split("+")
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version_major}/baka-#{version_major}+#{build}-macos.dmg",verified: "https://github.com/AniBakaBaka/AniBaka"
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
