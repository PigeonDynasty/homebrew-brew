cask "bililive-pigeon" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.5"
  sha256 arm:   "e70a8a0c8c69081a3283e3c34ec801b6bbfb0ea902b789ff54d498b5d987498e",
         intel: "e2c1c94dc941e57415ec022e9b30bc332f7acd06f07df5827a6cdef0d5295cbb"

  url "https://github.com/PigeonDynasty/bililive-pigeon-tauri/releases/download/v#{version}/Bililive.Pigeon_#{version}_#{arch}.dmg"
  name "Bililive Pigeon"
  desc "Bililive danmaku clirnt"
  homepage "https://github.com/PigeonDynasty/bililive-pigeon-tauri"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on :macos

  app "Bililive Pigeon.app"

  postflight_steps do
    run "sudo",
        args: ["xattr", "-r", "-d", "com.apple.quarantine",
               "/Applications/Bililive Pigeon.app"]
  end

  caveats "postflight script already executed quarantine removal."
end
