cask "meatshell" do
  version "v0.7.1"
  on_arm do
    sha256 "cfc3c52d44e2732c43f96151f20b1553fc41aae2a00c782e3f1cd439ad817fcb"
    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end

  on_intel do
    sha256 "f1c6ff403a3a5899735671fe14a12f7e1e35f3ca312afd52dde93c0509293bb3"
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
