cask "meatshell" do
  version "v0.6.11"
  on_arm do
    sha256 "19a73aabd8098ade1fa35eaaae9d9e67272553cd1eb55729d68a6468d6b3bc6f"
    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end

  on_intel do
    sha256 "c0120ca88ee42fe82ae4ca4bb4a7550add5fa0f61a2fea6317f3e731cb19c189"
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
