class Gitea2forgejo < Formula
  desc "One-time, full-fidelity migration from Gitea >=1.23 to Forgejo v15+"
  homepage "https://github.com/pacnpal/gitea2forgejo"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-arm64"
      sha256 "12013e8104fcf2a2990d8328c8445c824a48b10dde6e3536c556bf4ca38237bf"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-amd64"
      sha256 "9dae1cd96b602413e33f7a7850d9fe2f3972edaffd1091281e8b210008a8f9dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-arm64"
      sha256 "932ca4c22f95e3fa0c85571877dc4df83d3e84f9d466dd3cfca1428d74296cee"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-amd64"
      sha256 "78b08181787fab1e92f27a57f0ac652cf8334d3725b260ce302c40d47da72d23"
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
