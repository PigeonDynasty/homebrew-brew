cask "meatshell" do
  version "v0.6.16"
  on_arm do
    sha256 "1275265a5b100f3c5dd61202dccc1f6717e6ab3f6ac8259fec7b9c4bbf5dcebb"
    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end

  on_intel do
    sha256 "202eff35ff9a1baceafff99a22cf62104441baf15da0e8c894a9cfaf307c0c1b"
    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-x86_64.zip"
  end
  
  livecheck do
    url :url
  end

  auto_updates true

  name "meatshell"
  desc "一个轻量级、低内存占用的 SSH / 终端客户端（A lightweight, low-memory SSH / terminal client）"
  homepage "https://github.com/jeff141/meatshell"

  depends_on macos: :catalina

  app "meatshell.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", 
           "/Applications/meatshell.app"
  end
         
  caveats "postflight script already executed quarantine removal."
  
end
