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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.42/rozi-0.0.42-aarch64-apple-darwin.tar.gz"
      sha256 "df7bad2122b20412466003581d0a7a2e74a42a8446cd03304bfe700690978b7b"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.42/rozi-0.0.42-x86_64-apple-darwin.tar.gz"
      sha256 "26f5ff2e9033397b30ad570ab8232a3058fce6673ab53c43c455f71ed5b08894"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
