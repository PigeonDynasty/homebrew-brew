cask "baka" do
  version "5.0.6+0807"
          
  on_arm do
    sha256 "78c4a16e161b9578bc40ba4837ea7db3493a20ca53bab005737201645ed4494a"
    url "https://github.com/AniBakaBaka/AniBaka/releases/download/#{version}/baka-#{version}-macos-arm64.dmg",
        verified: "https://github.com/AniBakaBaka/AniBaka"
  end

  on_intel do
    sha256 "4bfeb9be116e7187b1669bc0db3844b7261c113caf651f3afdbdd7f5b93a1b3c"
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
