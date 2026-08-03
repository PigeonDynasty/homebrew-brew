cask "meatshell" do
  version "v0.6.9"
  sha256 "b9a865541589567c6a05332ebe92a9ec391c74250e5dbe7012369ec34ccee0c6"
          
  on_macos do
    url "https://github.com/jeff141/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
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
