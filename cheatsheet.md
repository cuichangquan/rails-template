# Cheat Sheet

### vim
# ファイル先頭にこのように追加するとfiletype=rubyが設定される. :set filetypeで確認できる
# 使用する際に全角を半角に変更してください。
-#　vim:　syntax=ruby

### neovim
- echo v:servername or echo $NVIM_LISTEN_ADDRESS

### よく使えそうなコマンド
- https://github.com/tpope/vim-surround       # text object (自作のobjectも対応できる)
- https://loumo.jp/wp/archive/20080701175525/ # プログラマが知っておくべき100のVimコマンド
- https://github.com/junegunn/fzf.vim         # commands                      # fzf.vim

### 最近開いたファイルリクス
- bro ol

### config
- :Config1          # private vim settings
- :Config2          # public vim settings

### outline viewer
- F8                # From: nmap <F8> :TagbarToggle<CR>

### memo
- :Memo             # Open MEMO List files

### open terminal
- TT                # newtab open
- :VT               # vsplit open
- <C-s>             # split open

### Insert Mode
- <C-o>^            # 行頭へ移動
- <C-o>$            # 行末へ移動

### Cheat
- :Cheat            # Diplay this file
- :CheatEdit        # Edit this file

### mapを確認したい
- map <c-e>         # ノーマルモードとビジュアルモードでの確認
- imap <c-e>        # Insertモードでの確認

### Dein.nvim
- :Dein recache_runtimepath # Recache
- :Dein check_clean         # Delete dis-used plugins
- :Dein update              # update target plugin

### Deine.nvim
  {key}  {mapping} "insert" mode mappings.
- <C-O>  <denite:enter_mode:normal>

### Debug
- scriptnames         # 読み込まれたvimスクリプトファイルリスト
- echomgs xxx         # :messageで確認できる
- PP                  # Ruby ppと似ている

### VimFiler
- <C-e>             # Open exproler
- ge                # Open Finder

### Resize window
- <C-t>             # Resize mode

### 調査系
- :PR               # カーソルの下のrevisionにてのBitbucketのPull-requestとJiraチケットの表示
- BB                # BitBucketにてソースコードの場所のURLの表示
- :G                # Gblameを表示する(Oを打つと、コミットの内容まで表示してくれます)

### 検索系
- :g//d             # マッチした行を削除
- :g/hoge/d         # 同上

- :v//d             # マッチしていない行を削除
- :v/hoge/d         # 同上

### vimコマンド、検索履歴
- F5                # コマンド履歴 元はq:でした。
- F6                # 検索履歴 元はq/でした
- F12               # 選択範囲の変更履歴を表示(git)
- :DiffOrig         # 保存していないバファでの変更の差分

### 編集系
- :v/./d            # 空白行の削除
- :v/\S/d           # これも空白行の削除
- :%s/\s*$          # 行末の空白の削除
- <space>hv         # 変更箇所レビュー
- ]h                # 次の変更箇所Jump
- [h                # 前の変更箇所

### マルチキーワードハイライト
- Space m           # Right ON
- Space M           # Reset

### Help Command
- h :command-completion-customlist

### vimとは関係ない仕事効率化ツール
- Shiftlt           # Resize App's Window

### Snippets
- ,,               # Snippets 展開(insert Mode)

### ruby
- !ruby -c         #  syntax check

### Rails
- :R, :RS, :RV, :RT                                       # swich jump to view, controller file etc
- :A, :AS, :AV, :AT                                       # swich jump to controller, test file etc
- :Econtroller, :Scontroller, :Vcontroller, :Tcontroller  # open controller
- :Emodel
- :set path?                                              # check loaded path list

### FZFで提供しているコマンド
- https://github.com/junegunn/fzf.vim#commands
- Commits
- BCommits         # Bufferファイルの変更履歴(よく使える)

### バッファ同士でdiffをとる
1.buffer1でdiffthisコマンドを打つ
2.buffer2でdiffthisコマンドを打つ

### Git
### Gitで更新頻度の高いファイルを見つける方法
- git log --name-only --oneline | grep -v ' ' | LC_ALL=C sort | uniq -c | LC_ALL=C sort -n

