cask "meatshell" do
  version "v0.8.2"

  on_arm do
    sha256 "856430a4bcdd1ed7efb8e6b60cde5de5e8f9f1762e7c56c1e8e5fb02644768ce"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "502ef3b1c31aeaa1df34cd8d634fff5560487c1364848b867c16e8bd76497d92"

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
