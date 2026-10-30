class Rozi < Formula
  desc "Tiling terminal multiplexer with self-arranging panes and persistent sessions"
  homepage "https://github.com/tui-lipan/rozi"
  license "MPL-2.0"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.39/rozi-0.0.39-aarch64-apple-darwin.tar.gz"
      sha256 "88ab329ddcc1700808259c595bf348598d6107d7add0e4a0bdf16868db79184b"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.39/rozi-0.0.39-x86_64-apple-darwin.tar.gz"
      sha256 "82ea5e3be36bb8666526603927fa1f955b4a1f5aa8085ce5b8616ec8caf48290"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
