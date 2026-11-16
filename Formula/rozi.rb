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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.49/rozi-0.0.49-aarch64-apple-darwin.tar.gz"
      sha256 "971a947c4cc39ae4aeaf569a13bf2b01e05c5163e950fe430358e1e743a92e35"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.49/rozi-0.0.49-x86_64-apple-darwin.tar.gz"
      sha256 "1acc7efafbdc52a5620b7a8c3ced42d05a800be4fcc76e993f2a965d1c2b31bd"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
