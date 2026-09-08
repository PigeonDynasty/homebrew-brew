cask "meatshell" do
  version "v0.7.3"

  on_arm do
    sha256 "5d3744863163e6b4bd02c82960886364fbf1d07bac0fc605bd0eaac3de8aa151"

    url "https://github.com/yituorou/meatshell/releases/download/#{version}/meatshell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "4c765c50e7b31ceb591164e1430dc02a2c9932dac45643ec2644c3be2c5c3775"

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
    run "sudo",
        args: ["xattr", "-r", "-d", "com.apple.quarantine",
               "/Applications/meatshell.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
