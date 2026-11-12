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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.46/rozi-0.0.46-aarch64-apple-darwin.tar.gz"
      sha256 "2d48c29e7fe2964e02d516d558a80775be912d34218bdf5f604319f1275629d5"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.46/rozi-0.0.46-x86_64-apple-darwin.tar.gz"
      sha256 "ee72cb0b0404487594b4c0d65324e431f4a4efd0baf7b583eee2953ae6508ba7"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
