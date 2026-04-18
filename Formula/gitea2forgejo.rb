class Gitea2forgejo < Formula
  desc "One-time, full-fidelity migration from Gitea >=1.23 to Forgejo v15+"
  homepage "https://github.com/pacnpal/gitea2forgejo"
  version "0.2.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-arm64"
      sha256 "2566cb169f46bfa88875cea185f0d4d997cd1ba3ddb93fdcf6631bbc1f9b3b5b"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-amd64"
      sha256 "a0c9f1d6d44df795f94e5a99856e51fc6c6b9cf79c5bd72ec0d096c5d9a5fa93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-arm64"
      sha256 "10ae674b028f2a524a17f1a6e61ace28bc50a5c70b34c2a9013e8be405392deb"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-amd64"
      sha256 "87c22519b44a9051b53e1d16cedec3cbeda95711379f676eea89c4b9011e2219"
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
