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
      url "https://github.com/tui-lipan/rozi/releases/download/v0.1.1/rozi-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "18a9ae9cae221929179dceb2464b905ab51fce6d2effacf3e33d31ca6abe729a"
    end
    on_intel do
      url "https://github.com/tui-lipan/rozi/releases/download/v0.1.1/rozi-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0017ac1e6ee04f6a351dd82451e143ecbf5cc9dced2c65afae8718af3e3be94d"
    end
  end

  def install
    bin.install "rozi"
  end

  test do
    assert_match "rozi #{version}", shell_output("#{bin}/rozi --version")
  end
end
