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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.47/rozi-0.0.47-aarch64-apple-darwin.tar.gz"
      sha256 "b351e2e316da13b6acab4e1d6a8ba426cd0194396ee2c5b416201ccfe0ee4bfd"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.47/rozi-0.0.47-x86_64-apple-darwin.tar.gz"
      sha256 "76b4b0444fcd185b39ee73a6b99e388fe29a8f70ab4886793cb8f705f53276c3"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
