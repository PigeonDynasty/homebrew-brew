cask "bililive-pigeon" do
  arch arm: "aarch64", intel: "x64"
  version "0.0.3"
  sha256  intel: ""e595414e2137fa082d00d3921889350d6d7439f9c6ac1d784d0fa9bcbbd56e4a"",
          arm:   "20e49d5f01ddb26ac52810f6fb59d63186929eeb0b19f5fdfcef407cc3650e0b"
          
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
