# dotfiles

このリポジトリは、chezmoiで個人設定を配布し、CLIと開発ツールの管理元を段階的にNixへ移行するための作業場所です。

## 管理の境界

| 対象 | 管理元 | このリポジトリでの扱い |
| --- | --- | --- |
| zsh・Git・Neovim・WezTerm・tmux | chezmoi | `dot_*` / `private_*` として配布 |
| Node・Pythonなどの言語バージョン | mise | `dot_config/mise/config.toml`で固定 |
| 共通CLI | Nix（段階移行） | `flake.nix` / `nix/cli-packages.nix`で宣言。chezmoiからは除外 |
| GUI・フォント・移行保留の例外 | Homebrew | `Brewfile.tmpl`で記録。Nix導入後に再評価 |
| プロジェクト固有の開発依存 | 各プロジェクトのdevShell | このリポジトリでは一括管理しない |

## 操作

設定の確認・反映と、パッケージの変更は別操作です。

```sh
# chezmoiの差分を確認（読み取り専用）
make chezmoi-diff

# 設定だけをホームへ反映
make chezmoi-apply

# Homebrewの宣言との差分を確認（読み取り専用）
make brew-check

# Brewfileの内容をHomebrewへ反映（インストール・リンクを伴う）
make brew-bundle

# パッケージ更新は必要なときだけ明示的に実行
make brew-update
make brew-upgrade
```

`make install`はセットアップ処理をまとめた互換入口ですが、Homebrewのupdate/upgradeは実行しません。新しいマシンでのchezmoi初期化とHomebrew導入が不要な場合は、個別のターゲットを使います。

新しいApple Silicon Macをこのリポジトリからまとめて初期化する場合は、Nix本体を公式インストーラで導入し、新しいターミナルを開いた後に次を実行します。

```sh
make bootstrap
```

`make bootstrap`は、Homebrew導入、chezmoi設定反映、Nix CLIのlock/check/build/profile反映、Brewfileの反映を順に実行します。Nixの`cli` profileがなければinstall、すでにあればupgradeへ分岐するため再実行できます。Homebrewの自動update/upgrade、既存パッケージの削除、PostgreSQLデータやLaunchAgentの変更は行いません。Brewfileの反映で不足しているGUIアプリやフォントはインストールされます。

## Nixの段階導入

Nix本体は、公式のマルチユーザーインストーラを一度だけ実行します。

```sh
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

新しいシェルを起動した後、flakeを検証・ビルドし、必要なときだけユーザープロファイルへ追加します。

```sh
make nix-lock
make nix-check
make nix-build
make nix-install
```

`make nix-lock`は`flake.lock`を新規作成または更新します。`make nix-install`は初回に`flake.nix`の`cli`出力をNixプロファイルへ追加します。lockや宣言を更新した後の既存profileの更新には`make nix-upgrade`を使います。いずれも既存Homebrewのアンインストールや設定ファイルの削除は行いません。パッケージの宣言更新は`make nix-update`を明示的に実行します。

Makefileはflake操作ごとに`nix-command`と`flakes`を一時的に有効化するため、`/etc/nix/nix.conf`を手作業で変更する必要はありません。

棚卸しの根拠と移行保留項目は[docs/package-inventory.md](docs/package-inventory.md)に記録しています。Homebrew CLIの削除、PostgreSQLのデータ移行、yabaiのLaunchAgent変更は、Nix CLIの実行確認と個別バックアップ後の別段階です。
