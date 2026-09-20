# dotfiles

このリポジトリは、chezmoiで個人設定を配布し、CLIと開発ツールの管理元を段階的にNixへ移行するための作業場所です。

## 管理の境界

| 対象 | 管理元 | このリポジトリでの扱い |
| --- | --- | --- |
| zsh・Git・Neovim・WezTerm・tmux | chezmoi | `dot_*` / `private_*` として配布 |
| Node・Pythonなどの言語バージョン | mise | `dot_config/mise/config.toml`で固定 |
| 共通CLI | Nix（段階移行） | `flake.nix` / `nix/`を将来追加。chezmoiからは除外 |
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

棚卸しの根拠と移行保留項目は[docs/package-inventory.md](docs/package-inventory.md)に記録しています。Nix導入、Homebrew CLIの削除、PostgreSQLやLaunchAgentの変更は、棚卸し後の別段階です。
