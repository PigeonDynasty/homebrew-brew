cask "bililive-pigeon" do
  arch arm: "aarch64", intel: "x64"
  version "0.0.5"
  sha256  intel: "e2c1c94dc941e57415ec022e9b30bc332f7acd06f07df5827a6cdef0d5295cbb",
          arm:   "e70a8a0c8c69081a3283e3c34ec801b6bbfb0ea902b789ff54d498b5d987498e"
          
  url "https://github.com/PigeonDynasty/bililive-pigeon-tauri/releases/download/v#{version}/Bililive.Pigeon_#{version}_#{arch}.dmg"
  
  livecheck do
    url :url
  end

  auto_updates true

  name "Bililive Pigeon"
  desc "bililive pigeon."
  homepage "https://github.com/PigeonDynasty/bililive-pigeon-tauri"

  depends_on macos: ">= :catalina"

  app "Bililive Pigeon.app"
  
  caveats <<~EOS
    You may need to enter the following code in the terminal to get it to work
    'sudo xattr -r -d com.apple.quarantine /Applications/Bililive Pigeon.app'
  EOS
end
