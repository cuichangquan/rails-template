" https://postd.cc/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" https://qiita.com/xeno1991/items/8d1c8f38595337bab7c8
let g:tex_conceal='' " texのconcealを無効化（#^ω^）

" これを指定することによって、起動起動スピードが早くなった.
" https://yu8mada.com/2018/08/03/how-to-install-neovim-on-macos-using-homebrew-and-set-it-up-to-make-it-able-to-be-used/
let g:python_host_prog  = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('/usr/local/opt/python@3.8/bin/python3')
let g:ruby_host_prog = expand('/usr/local/opt/ruby/bin/ruby')

" MEMO
" 自前のpluginを追加する時に
" https://www.nekochango.com/entry/linux/nvim/plugin
" let my_plugin_list = [
"\ "$HOME/.config/nvim/userautoload/plugins/plugin_neosnippet.vim"           ,
"\ "$HOME/.config/nvim/userautoload/plugins/plugin_vimfiler.vim"
"\ ]
"
" let i = 0
" while i < len(my_plugin_list)
"     let f = my_plugin_list[i]
"     if filereadable(expand(f))
"         source `=f`
"     endif
"     let i = i + 1
" endwhile

" About Dein
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" キャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#local('~/sai/local-plugins', { 'frozen' : 1 }, ['denite-create-test'])
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

source ~/sai/my-work-helper/neovim/common-config.vim

" https://github.com/mhinz/neovim-remote
" このように設定することで、lazygitがneovimで「e」キーで対象ファイルを開けた。
let $VISUAL = 'nvr'
" 「e」で対象ファイル開けなかった。そもそも引数があると、だめぽい。
" let $VISUAL = 'nvr -cc split --remote-wait'
