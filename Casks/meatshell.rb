cask "meatshell" do
  version "v0.6.14"
  on_arm do
    sha256 "9b3df9eadf4375e2ef58ec7c55e1eff11aebc371a09cd8aa33154746b5d0b3f9"
    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end

  on_intel do
    sha256 "6ece64203419f34985e49e0241735ea2e8a99b38319459374b0db96c3d29dff8"
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
