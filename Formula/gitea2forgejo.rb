class Gitea2forgejo < Formula
  desc "One-time, full-fidelity migration from Gitea >=1.23 to Forgejo v15+"
  homepage "https://github.com/pacnpal/gitea2forgejo"
  version "0.2.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-arm64"
      sha256 "5253b0d97b2d77b1c8b789c7e621d323cb361c2be0b2b572c85f055cd884d014"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-darwin-amd64"
      sha256 "69de7aeaf22640f81cc00c775f5648c31f0c6a363ff814606ff746b923308ac2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-arm64"
      sha256 "8da16a42e2412c98b213e0645892046ae315418b97b727b99ceb201e8ef52070"
    end
    on_intel do
      url "https://github.com/pacnpal/gitea2forgejo/releases/download/v#{version}/gitea2forgejo-linux-amd64"
      sha256 "6ca8f13029b5c67cf5262bc6afead8179f65843948c41e228c4625ba95ca042a"
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
