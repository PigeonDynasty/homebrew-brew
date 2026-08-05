cask "baka" do
  version "5.0.5+0803"
          
  on_arm do
    sha256 "cad544204f316ef856f5f7ed540433e1814a3efdc0798014da5e04f039067907"
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg",
        verified: "https://github.com/AniBakaBaka/AniBaka"
  end

  on_intel do
    sha256 "0390d19aaf182eb0bfd1800845b86caa7faba5a57b2aa09ac0e70aa54bf04135"
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
