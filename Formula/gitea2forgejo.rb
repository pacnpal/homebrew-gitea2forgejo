class Gitea2forgejo < Formula
  desc "One-time, full-fidelity migration from Gitea >=1.23 to Forgejo v15+"
  homepage "https://github.com/pacnpal/gitea2forgejo"
  version "0.2.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-arm64"
      sha256 "e34165c74c601c81cfba755ec2e27fc80983d0c68189953626f33ff97b5986c2"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-amd64"
      sha256 "889ddc0d900f7603dfd8b990467980f5ab7f19bcf9b74803edaa511ac42dc838"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-arm64"
      sha256 "712d132050762e8e167e00d94d544770d741fda1e3193061779fbad20b9ee2fc"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-amd64"
      sha256 "45fbcf447e47f2474663ce6dfb3dbf47a28f03ddae142fa79d040b0ee5285d64"
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
