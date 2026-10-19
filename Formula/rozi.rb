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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.31/rozi-0.0.31-aarch64-apple-darwin.tar.gz"
      sha256 "a891f4f31278bd492eea1fdc3822f5f60dc9b6dac3344920a086b6715c8a695a"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.31/rozi-0.0.31-x86_64-apple-darwin.tar.gz"
      sha256 "9e1786991968848362f529385f5346a405ff705ef4a59d8a67491a7f610a8b97"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
