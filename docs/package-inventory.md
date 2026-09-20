# Package and path inventory

調査日: 2026-09-20

この表は、Nix導入前の現状を固定するための棚卸しです。確認したコマンドは、`command -v` / `type -a`、両prefixのCellar、`chezmoi managed`、`chezmoi diff`、`~/Library/LaunchAgents`、`Brewfile.tmpl`です。表にないものを不要とは判断しません。

## 実行元と管理方針

| 対象 | 現在の実行元・状態 | 判定 | 次の扱い |
| --- | --- | --- | --- |
| `brew` | `/opt/homebrew/bin/brew`が先頭。`/usr/local/bin/brew`も存在するがmacOS 26.6.2を認識できず一覧取得不可 | 必須・二重構成 | `/opt/homebrew`を正とし、旧brewはデータ確認後に撤去 |
| `chezmoi` | `/usr/local/bin/chezmoi` → 旧Cellar 2.25.0 | 必須・移行候補 | Nix版へ切り替えるまで保持。現在のsourceはこのリポジトリ |
| `mise` | `/opt/homebrew/bin/mise` | 必須・移行候補 | Node/Pythonのバージョン管理は継続。mise本体のみNix候補 |
| `direnv` | `/opt/homebrew/bin/direnv` | 必須・移行候補 | Nix候補。zsh hookは存在時だけ初期化 |
| `git` / `jq` | `/usr/bin/git` / `/usr/bin/jq` | 現状維持 | Nix移行時に用途と優先順位を再確認 |
| `rg` | `/usr/local/bin/rg` → 旧Cellar 13.0.0 | 必須・移行候補 | Nix版へ切り替え、旧版は検証後に撤去 |
| `fd` | 現在見つからない | Brewfileとの差分 | Nix導入候補。先に必要な作業で確認 |
| `nvim` / `tmux` / `starship` | いずれも `/usr/local`由来 | 必須・移行候補 | 設定はchezmoiに残し、実行ファイルを段階移行 |
| `psql` | `/usr/local/bin/psql` → PostgreSQL 14.8_1。ローカルソケットへの接続は失敗し、プロセスもなし | データ依存・保留 | 42MBの旧クラスタをバックアップ・内容確認してから判断 |
| `bun` / `go` / `xcodegen` | `/opt/homebrew/bin` | 利用実績あり | NixまたはdevShellへの移行候補。代表作業で検証 |
| `git-lfs` | 見つからないが`.gitconfig`はfilterを宣言 | 設定と実体の不一致 | 実際のLFS利用を確認し、必要ならNixで管理 |
| `anyenv` | `/usr/local/bin/anyenv` | ランタイム管理の重複候補 | mise利用状況を確認後に停止・撤去を判断 |
| `nvm` / `tfenv` | Brewfileには宣言、現在のPATHでは見つからない | 宣言と実体の不一致 | miseで代替できるかを用途別に確認 |
| MySQL | `/opt/homebrew/opt/mysql@8.0/bin`は不存在、`mysql`も見つからない | 古い固定パス | zshから死んだPATHを追加しない。利用が必要なら別途選定 |
| Miniforge / Conda | `/opt/homebrew/Caskroom/miniforge/base`は不存在、`conda`も見つからない | 古い固定パス | zshから死んだPATHを追加しない。Pythonはmise設定を正とする |

## 第二段階のNix定義

`flake.nix`と`nix/cli-packages.nix`に、Homebrewから段階移行する共通CLIを定義しました。対象は`actionlint`、`awscli2`、`chezmoi`、`deno`、`direnv`、`eza`、`fd`、`gh`、`git-delta`、`git-lfs`、`go`、`jq`、`mise`、`neovim`、`ripgrep`、`starship`、`tmux`です。Bun、Python、Xcode関連、GUI、PostgreSQL、yabaiは現行用途または移行リスクを理由にこの出力へ入れていません。

Nix本体は導入済みです。Nix 2.35.2のmulti-user daemonが稼働し、`cli` profileを`~/.nix-profile`へ追加しています。`flake.lock`は`nixpkgs-26.05-darwin`の2026-09-15時点のrevへ固定しました。aarch64-darwinの評価・ビルドに加え、x86_64-darwinの評価も成功しています。x86_64-darwinは26.05が最後の対応版という警告が出るため、将来の更新時に再判断します。

新しいログインシェルでは、chezmoi、mise、direnv、ripgrep、fd、Neovim、tmux、starship、git-lfs、actionlint、AWS CLI、eza、gh、Go、jq、DenoがNix profile由来になり、Nodeは引き続きmise管理版です。miseが継承PATHを再構成しても、Nix profileを優先し、存在しないMySQL／Miniforgeのパスを除去します。旧Homebrewのアンインストールはまだ行っていません。

Nixへ移した共通CLI（`actionlint`、`awscli`、`chezmoi`、`direnv`、`deno`、`eza`、`fd`、`gh`、`git-delta`、`go`、`jq`、`mise`、`neovim`、`ripgrep`）は`Brewfile.tmpl`の宣言から外しました。Homebrew側の実体は、プロジェクトの絶対パス参照と利用実績を監査するまで削除しません。`anyenv`、`nvm`、`tfenv`も現在のPATHに存在せず、miseでの代替確認後に宣言対象から外しています。

## Homebrewの二つのprefix

### `/opt/homebrew`

現行brewは一覧取得可能です。直接入っている主なformulaeは、`direnv`、`git-delta`、`gh`、`go`、`mise`、`bun`、`xcodegen`、`python@3.10`、`python-tk@3.10`、`cloudflared`、`stripe`などです。caskは`wezterm`、`drawio`、`selfcontrol`、`chromedriver`です。`brew services list`で確認できた`cloudflared`は停止状態でした。

### `/usr/local`

旧brewはmacOS 26.6.2で`unknown or unsupported macOS version`となり、`brew list`や`brew services`による完全な照合はできません。Cellarには、`chezmoi`、`ripgrep`、`neovim`、`tmux`、`starship`相当の実行ファイル、`ffmpeg`、`postgresql@14`、`gcc`、`p11-kit`、`unbound`などが残っています。

旧Cellarには依存ライブラリも多数含まれるため、CellarのディレクトリをそのままNixのパッケージ一覧へ移植しません。`postgresql@14`のようなデータを持つ可能性があるものと、LaunchAgentから参照されるものを先に個別確認します。

## Brewfileとの差分

### 宣言されているが、現行`/opt/homebrew`で直接確認できないもの

`actionlint`、`anyenv`、`awscli`、`chezmoi`、`deno`、`eza`、`fd`、`p11-kit`、`unbound`、`gnutls`、`libass`、`libbluray`、`srt`、`ffmpeg`、`gcc`、`ghostscript`、`gifsicle`、`nvim`、`nvm`、`ripgrep`、`tfenv`などです。依存関係や旧prefix由来の可能性があるため、ここで自動削除・自動再インストールはしません。

### 現行`/opt/homebrew`にあるが、直接宣言が見えないもの

`bun`、`cloudflared`、`python@3.10`、`python-tk@3.10`、`stripe`、`xcodegen`、および`drawio`、`selfcontrol`、`chromedriver`です。用途が明確なものはHomebrewのGUI・例外または作業環境として残し、共通CLIへ移す候補はNix移行時に宣言元を一つへ寄せます。

### シェルやGit設定が参照するが宣言・実体が揃っていないもの

`starship`、`git-lfs`、MySQL、Miniforge/Condaです。`starship`は旧`/usr/local/bin`に存在しますがBrewfileにはなく、`git-lfs`・MySQL・Condaは現在のコマンドとして見つかりません。

## LaunchAgentとデータ保全

- `homebrew.mxcl.yabai.plist`が`/usr/local/opt/yabai/bin/yabai`と`/usr/local/var/log/yabai`を参照しています。現在はyabai本体が見つからず、サービスも存在しませんが、plistは有効設定として残っています。旧brew撤去前に、設定・権限・利用意図を確認します。
- `com.kaji.collector.socialops.plist`は`/opt/homebrew/bin/bun`を参照します。Bunを移行する場合はLaunchAgentの絶対パスも同時に更新します。
- `com.cronosu.service.*.plist`と`com.socialops.loop.plist`はPATHに両prefixを含みます。CLI移行後に、ログインシェル以外のPATHを別途検証します。
- 名前・内容からPostgreSQL/MySQLを起動するLaunchAgentは今回の検索では確認できず、`launchctl list`にも該当ラベルはありませんでした。`psql`は旧Cellarを参照し、`/usr/local/var/postgres`には約42MBのデータディレクトリが存在します。現時点で稼働プロセスやローカルソケットはないため、バックアップ・内容・利用元を確認するまで旧brewやデータを削除しません。

## 既存設定の整理結果

- `private_dot_zshrc`のGCP環境変数は同じ値が21回ずつ重複していたため、値を変えず1回へ集約します。
- zshは、PATH・mise、direnv、Conda、Git、alias、表示、アーキテクチャの順に固定して読み込みます。既存のplugin配下はコア設定の後に読み込みます。
- MySQLとCondaは、インストール先が存在する場合だけPATHやhookを有効化します。
- `dot_config/nvim/lazy-lock.json`の未コミット差分は既存作業として保持し、今回の重複整理では変更しません。LuaSnip・lspkind、surround・sandwichの設定は現段階では削除せず、操作実績を確認してから判断します。
- Nix版chezmoiで確認した`architecture.zsh`の`a64`→`x64`差分は、ホーム側の既存変更として上書きせず保持しています。
