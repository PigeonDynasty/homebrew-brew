cask "baka" do
  version "5.0.7+0811"
          
  on_arm do
    sha256 "ef66b122316762974fbfbb306ebdd1769378369c598fb5cab1e1015fe42af764"
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg",
        verified: "https://github.com/AniBakaBaka/AniBaka"
  end

  on_intel do
    sha256 "cf6eab8cd2f0dca06565caedddbe518e2e4f91554529f5d1a576d6ad0c855fee"
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
