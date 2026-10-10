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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.29/rozi-0.0.29-aarch64-apple-darwin.tar.gz"
      sha256 "5f2e64dd998750c8cfe53786362ce9092125a6a7b270c7c3a34ddbcb2a750a28"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.29/rozi-0.0.29-x86_64-apple-darwin.tar.gz"
      sha256 "d9531b9af26845c5cb160b1913463de1c1644608afcb1dcbceca477e65664cbe"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
