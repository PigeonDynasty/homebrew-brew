cask "meatshell" do
  version "v0.8.0"

  on_arm do
    sha256 "8a37208a9e65a8119eb9cf9d4cdc23c8265bbc6444324da775397dc5d8d6581f"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "caf1c424475e26f9f1209d7ce190f044d9feaab426b4c7e4ae68fc025bb3f580"

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
