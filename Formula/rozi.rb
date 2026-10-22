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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.32/rozi-0.0.32-aarch64-apple-darwin.tar.gz"
      sha256 "a23d2c6032f4d1c61776e841e4fcb3e5eb0726912f96315c9cfe652528fc46cd"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.32/rozi-0.0.32-x86_64-apple-darwin.tar.gz"
      sha256 "5de632c7bdb71a59a53838f2dbf38721a3551326fa01a4c39814076c533f5092"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
