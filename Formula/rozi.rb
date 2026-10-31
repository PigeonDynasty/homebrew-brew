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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.40/rozi-0.0.40-aarch64-apple-darwin.tar.gz"
      sha256 "79d8fc303791293ae7645d6a5395087d0f7641f41ddd3ca2561967c528786606"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.0.40/rozi-0.0.40-x86_64-apple-darwin.tar.gz"
      sha256 "d790f878100b197399f61a8732be86d03b3e3ddf022bbcb2b422290a40ff063e"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
