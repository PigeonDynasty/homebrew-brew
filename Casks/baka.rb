cask "baka" do
  version "4.5.0,0213"
  sha256 "946369438b357ba1ea16a9e6c089e53540822ffd77a7e4a7df381c3eae608fed"
          
  on_macos do
    version_major, build = version.split(",")
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version_major}/baka-#{version_major}+#{build}-macos.dmg"
  end
  
  livecheck do
    url :url
  end

  auto_updates true

  name "anibaka"
  desc "一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。"
  homepage "https://ani-baka.vercel.app"

  depends_on macos: ">= :catalina"

  app "Baka.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", 
           "/Applications/Baka.app"
  end
         
  caveats "postflight script already executed quarantine removal."
  
end
