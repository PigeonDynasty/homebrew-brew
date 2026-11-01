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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.41/rozi-0.0.41-aarch64-apple-darwin.tar.gz"
      sha256 "f9528b9b8e71b7508b3883ff2fdb34ddec2536823a0157312f1b87d2c321931a"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.41/rozi-0.0.41-x86_64-apple-darwin.tar.gz"
      sha256 "e8c54643148812ccb5ad72231bdffcb9a412a85dbbf4b7cca401704eff956151"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
