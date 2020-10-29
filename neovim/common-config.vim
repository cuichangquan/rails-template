colorscheme elflord
" https://yukidarake.hateblo.jp/entry/2015/07/10/201356
set timeout timeoutlen=500 ttimeoutlen=50

syntax on
filetype on            " ファイル形式の検出を有効化
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" -- Option系 --
" set nows             " 文字列検索の際、ファイルの終端から先頭に戻らない
set number
" set relativenumber     " 行番号を相対表示にする、移動しやすくするため
set nocompatible      " We're running Vim, not Vi!
set termencoding=utf-8
set encoding=utf-8     " 文字コードの設定
set fileencoding=utf-8 " fileencodingsの設定ではencodingの値を一番最後に記述する
set hlsearch           " 検索文字をハイライト
set smartcase          " 大文字小文字無視, 大文字ではじめたら大文字小文字無視しない
set laststatus=2       " 常にステータスラインを表示
set tabstop=2          " ファイル内の <Tab> が対応する空白の数。
set shiftwidth=2       " 自動インデントの各段階に使われる空白の数。
set expandtab          " Insertモードで: <Tab>
" set autoindent       " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set hidden             " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set wildmenu           " コマンドライン補完を拡張モードにする
set wildmode=list:longest,full
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
set cursorline         " カーソル行の強調表示
set mouse=a
set notagbsearch
set ignorecase
set ruler

" insert mode で deleteを有効にする
" https://sseze.hatenablog.com/entry/20120414/1334398422
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" -- map系 --
" <Del> key: ノーマルモードで数値 (count) を入力しているときは、数字の最後の桁を削除します。
map CTRL-V <BS>   CTRL-V <Del>

" <Leader>のmapについて、
" よく使うのは機能:              <Leader> X 1
" それほど使っていないのは機能:  <Leader> X 2
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader>q :qa!<CR>
nnoremap <Leader><Leader>b :set filetype=bash<CR>

" 素早く動きたいので
nnoremap tt F
nnoremap aa ^
nnoremap al $
" jump to the middle of current line
nnoremap am :call cursor(0, virtcol('$')/2)<CR>
nnoremap mm %

vnoremap aa ^
vnoremap al $
" jump to the middle of current line
vnoremap am :call cursor(0, virtcol('$')/2)<CR>
vnoremap mm %

" 貼り付けたばかりのテキストを再選択
" https://qastack.jp/vi/31/how-do-i-visually-select-the-block-of-text-i-just-pasted-in-vim
nnoremap gV `[v`]

" matchit.vim
" TODO
" nnoremap mm :<C-U>call <SNR>50_Match_wrapper('',1,'n') <CR>
" vnoremap mm :<C-U>call <SNR>50_Match_wrapper('',1,'v') <CR>m'gv``

" used in buffers <Leader>b
" nnoremap <Leader>b %
nnoremap <Leader>f *N
nnoremap <Leader>j '"
nnoremap <Leader>[ '[
nnoremap <Leader>] ']
nnoremap <Leader>; g,
nnoremap ,,  A,<ESC>

" これも生産性を生む
" gn gN: select text highlighted by search

nnoremap <Leader>g :Lazygit<CR>
nnoremap <Leader>h :call Open_existed_vifm_buffer()<CR>
nnoremap <Leader>d :call Toggle_current_directory()<CR>

" Plugin 't9md/vim-quickhl'
"---------------------------------------------------
" nmap <Leader>m <Plug>(quickhl-manual-this)
" xmap <Leader>m <Plug>(quickhl-manual-this)
" nmap <Leader>M <Plug>(quickhl-manual-reset)
" xmap <Leader>M <Plug>(quickhl-manual-reset)
"---------------------------------------------------

" https://github.com/MattesGroeger/vim-bookmarks
" Add/remove bookmark at current line	        mm :BookmarkToggle
" Show all bookmarks (toggle)	                ma :BookmarkShowAll
" Clear bookmarks in current buffer only	    mc :BookmarkClear
" Clear bookmarks in all buffers	            mx :BookmarkClearAll
" 頻繁に使っている機能ではないので、<Leader> X 2
nmap <Leader><Leader>mm <Plug>BookmarkToggle
nmap <Leader><Leader>ma <Plug>BookmarkShowAll
nmap <Leader><Leader>mc <Plug>BookmarkClear
nmap <Leader><Leader>mx <Plug>BookmarkClearAll
nmap <Leader><Leader>mn <Plug>BookmarkNext
nmap <Leader><Leader>mp <Plug>BookmarkPrev

" 縦分割版gf
" https://yuheikagaya.hatenablog.jp/entry/2012/12/03/202556
nnoremap gs :vertical wincmd f<CR>

if has('nvim')
  set clipboard=unnamedplus
  " Make Terminal default mode insert
  " https://github.com/neovim/neovim/issues/8816
  autocmd TermOpen term://* startinsert
  nnoremap <Leader><Leader>s :vs<CR><C-w>l:vert term<CR>
  tnoremap <Esc><Esc><Esc> <C-\><C-n>:q!<CR>
  command! Lazygit tabnew term://lazygit

  autocmd TermClose term://.//*:lazygit* bprevious | bwipeout!
else
  set clipboard=unnamed
  tnoremap <Esc><Esc><Esc> <C-W><C-C>
  nnoremap <Leader><Leader>s :vert term<CR>
  command! Lazygit :tab term ++close lazygit
endif

" http://cohama.hateblo.jp/entry/20130108/1357664352
vnoremap P "0p

" https://neovim.io/doc/user/nvim_terminal_emulator.html#terminal-emulator
tnoremap <Esc><Esc> <C-\><C-n>
" " <A-h>
" tnoremap ˙ <C-\><C-N><C-w>h
" " <A-j>
" tnoremap ∆ <C-\><C-N><C-w>j
" " <A-k>
" tnoremap ˚ <C-\><C-N><C-w>k
" " <A-l>
" tnoremap ¬ <C-\><C-N><C-w>l

nnoremap <C-k> 10<UP>
nnoremap <C-j> 10<DOWN>
nnoremap <C-h> 15<LEFT>
nnoremap <C-l> 15<RIGHT>

vnoremap <C-k> 10<UP>
vnoremap <C-j> 10<DOWN>
vnoremap <C-h> 15<LEFT>
vnoremap <C-l> 15<RIGHT>


" From: https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" window移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" window回転
nnoremap sr <C-w>r

nnoremap sn :<C-u>bn<CR>
nnoremap sp :<C-u>bp<CR>
" buffer close
nnoremap sq :<C-u>bd<CR>
" nnoremap <CR> G
" nnoremap <BS> gg

noremap gV `[v`]
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap ss :<C-u>split<CR>
nnoremap sv :<C-u>vsplit<CR>
nnoremap st :<C-u>tabnew<CR>

nnoremap <C-s> :call Open_existed_vifm_buffer()<CR>
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :<C-u>FZF<CR>

" https://qiita.com/ymiyamae/items/cea5103c65184f55d62e
"行頭へ移動
inoremap <C-b> <C-o>^
"行末へ移動
inoremap <C-e> <C-o>$
"挿入モードのときに hjkl でカーソルを移動する
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap jj <ESC>
inoremap kk <ESC>
inoremap hh <ESC>
" all, hall 結構ある
" inoremap ll <ESC>
inoremap <C-s> <ESC>:w<CR>

" コマンド履歴Windowはうるさいから、:qに置き換える
" map q: :q
" こうすることでマイクロを終了したい時にqの待ち時間が嫌だ

" copy current file name to clipboard
" http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" just filename
nnoremap cn :let @+ = expand("%:t")<CR>
" 相対パス
nnoremap cp :let @+=expand("%")<CR>
" full path
nnoremap cz :let @+ = expand("%:p")<CR>
" 拡張無しのファイル名
nnoremap cf :let @+ = fnamemodify(expand("%:p"), ":t:r:r")<CR>

" https://stackoverflow.com/questions/49165624/netrw-modifying-directories-always-complains
autocmd FileType netrw setlocal bufhidden=delete

"保存時に行末の空白を自動で削除(2016-10-21)
autocmd BufWritePre * :%s/\s\+$//ge

" https://qiita.com/1000k/items/6d4953d2dd52fdd86556
" ANSI color codes を除去する
command! DeleteAnsi %s/\[[0-9;]*m//g

" ? or / 検索したキーワード数をカウントする。
" http://advweb.seesaa.net/article/13053855.html   # 「|」で区切って、複数のコマンドを連続一度実行
" http://d.hatena.ne.jp/hide04/20111223/1324621495 # vimコマンド出力をクリップボードへコピー
command! Count :redir @*> | :%s//&/gn | :redir END

" https://superuser.com/questions/214696/how-can-i-discard-my-undo-history-in-vim
" A function to clear the undo history
function! <SID>ForgetUndo(isBang)
    let old_undolevels = &undolevels
    set undolevels=-1
    if a:isBang ==# ''
      edit!
    else
      exe "normal a \<BS>\<Esc>"
    endif
    let &undolevels = old_undolevels
    unlet old_undolevels
endfunction
command! -bang -nargs=0 UndoClear call <SID>ForgetUndo('<bang>')
command! -bang -nargs=0 ClearUndo call <SID>ForgetUndo('<bang>')

" 最後に保存してから、どのくらい編集したのかの差分を表示
" gitが感知できないバファの変更を表示してくれる
" https://nanasi.jp/articles/howto/diff/diff-original-file.html
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis


"Delete all Git conflict markers
"https://vi.stackexchange.com/questions/10534/is-there-a-way-to-take-both-when-using-vim-as-merge-tool
function! RemoveConflictMarkers() range
  " echom a:firstline.'-'.a:lastline
  silent execute a:firstline.','.a:lastline . ' g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d'
endfunction
"-range=% default is whole file
command! -range=% GremoveConflictMarkers <line1>,<line2>call RemoveConflictMarkers()

if has('nvim')
  source ~/sai/my-work-helper/neovim/jira_prject.vim
  source ~/sai/my-work-helper/neovim/ccq.vim
  source ~/sai/work-config/work-config.vim
else
  " vimだけの機能(neovimではなく)
  source ~/sai/work-config/work-config-for-vim.vim
endif

" TODO:なんか効いていない。
" https://postd.cc/how-to-boost-your-vim-productivity/
" vp doesn't replace paste buffer
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" function! s:Repl()
"   let s:restore_reg = @"
"   return "p@=RestoreRegister()\<cr>"
" endfunction
" vmap <silent> <expr> p <sid>Repl()

" https://qiita.com/wadako111/items/755e753677dd72d8036d
" The prefix key.
nnoremap [Tag]   <Nop>
nmap t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

function! Open_existed_vifm_buffer() abort
  if bufname('^vifm:') != ""
    execute("buffer vifm:")
    execute("normal i")
  else
    execute(":Vifm")
  endif
endfun

function! Toggle_current_directory() abort
  let pwd = getcwd()
  let root = FindRootDirectory()
  let current_file_directory = expand('%:p:h')

  if current_file_directory == pwd
    execute("cd " . root )
    execute("pwd")
  else
    execute("cd " . current_file_directory)
    execute("pwd")
  endif
endfun

command! ToggleCurrentDirectory call Toggle_current_directory()
