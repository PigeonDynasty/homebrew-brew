cask "meatshell" do
  version "0.6.2"
  sha256 "84ae44d4accc1b8b73a56c1dfcec128e0536013eda7b16961a95ef5d863f350b"
          
  on_macos do
    url "https://github.com/jeff141/meatshell/releases/download/v#{version}/meatshell-v#{version}-macos-aarch64.zip"
  end
  
  livecheck do
    url :url
  end

  auto_updates true

  name "meatshell"
  desc "一个轻量级、低内存占用的 SSH / 终端客户端（A lightweight, low-memory SSH / terminal client）"
  homepage "https://github.com/jeff141/meatshell"

  # depends_on macos: :catalina

  app "meatshell.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", 
           "/Applications/meatshell.app"
  end
         
  caveats "postflight script already executed quarantine removal."
  
end
