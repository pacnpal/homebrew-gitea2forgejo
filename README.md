# homebrew-gitea2forgejo

Homebrew tap for [gitea2forgejo](https://github.com/pacnpal/gitea2forgejo) — a
one-time, full-fidelity migration tool from Gitea ≥ 1.23 to Forgejo v15+.

## Install

```sh
brew tap pacnpal/gitea2forgejo
brew install gitea2forgejo
```

Homebrew will pull in the required external tools (`rsync`, `libpq` for
`pg_dump`, `mysql-client`, `sqlite`, `zstd`) automatically as formula
dependencies.

Optional extras, install only if you need them:

```sh
brew install minio/stable/mc    # S3 / MinIO bucket mirror
brew install skopeo             # OCI container package migration
```

## Update

```sh
brew update
brew upgrade gitea2forgejo
```

Or use the built-in self-updater:

```sh
gitea2forgejo update
```

## Supported platforms

- macOS (Apple Silicon + Intel)
- Linux (amd64 + arm64) via Homebrew on Linux

The formula downloads pre-built binaries signed with SLSA Level 3 provenance
— see [upstream release notes](https://github.com/pacnpal/gitea2forgejo/releases)
for verification instructions.
