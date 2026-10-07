cask "meatshell" do
  version "v0.7.5"

  on_arm do
    sha256 "07857b09ebc0ec2399edcffa11a2984a84fc220ddacab04f0861583348a0738a"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "4d203838534ad30a99211fc8bfc7b45be9c974ddefb2fde68441c4bfa2ad4b84"

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
