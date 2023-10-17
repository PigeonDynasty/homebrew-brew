cask "bililive-pigeon" do
  arch arm: "aarch64", intel: "x64"
  version "0.0.4"
  sha256  intel: "df4cbe54cad306d9a3247686f80e7a24b4baea97dea532ca82226f94e5bc1353",
          arm:   "c5eea3a8bf72bcd05699e6dcc078cdfbb752b22b9cd7c453a864ffaa4a332910"
          
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
