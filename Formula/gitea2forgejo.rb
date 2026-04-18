class Gitea2forgejo < Formula
  desc "One-time, full-fidelity migration from Gitea >=1.23 to Forgejo v15+"
  homepage "https://github.com/pacnpal/gitea2forgejo"
  version "0.2.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-arm64"
      sha256 "57630d159ecb828b59731db76aa9485e3bc069c2706d78b44156cf5e0223d024"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-amd64"
      sha256 "d376c39e8655626f74535c2bf20f7215ff88d48cc03ffa1a74e8618beaed7db8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-arm64"
      sha256 "64fe5189ede605a0108aa02ff41a4539d95714e7633a7ecb10c1164bceb89f10"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-amd64"
      sha256 "e1dd193d76e913827772eba111de60a67947d41d7f2a9ab35dc261fc5f79db08"
    end
  end

  depends_on "rsync"
  depends_on "libpq"
  depends_on "mysql-client"
  depends_on "sqlite"
  depends_on "zstd"

  def install
    platform =
      case [OS.mac?, Hardware::CPU.arm?]
      when [true,  true]  then "darwin-arm64"
      when [true,  false] then "darwin-amd64"
      when [false, true]  then "linux-arm64"
      else                     "linux-amd64"
      end
    bin.install "gitea2forgejo-#{platform}" => "gitea2forgejo"
  end

  test do
    assert_match(/gitea2forgejo/, shell_output("#{bin}/gitea2forgejo --version"))
  end
end
