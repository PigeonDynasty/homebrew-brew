cask "meatshell" do
  version "v0.7.4"

  on_arm do
    sha256 "e84ba8f38260f25ba2a63bc0eef7939d7085df158f97e6b39ced91a5d0fd2807"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "f8945fcd253706cc6b5d4cf9a822a04ec3b4e35a2975f66e0c51cf5e20812ee4"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-x86_64.zip"
  end

  name "meatshell"
  desc "一个轻量级、低内存占用的 SSH / 终端客户端（A lightweight, low-memory SSH / terminal client）"
  homepage "https://github.com/jeff141/meatshell"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on :macos

  app "meatshell.app"

  postflight_steps do
    run "xattr",
        args: ["-r", "-d", "com.apple.quarantine",
               "/Applications/meatshell.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
