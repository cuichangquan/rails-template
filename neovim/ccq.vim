" 選択した範囲のコミット履歴を表示する
" このコマンドのラッパー: Git! log -L <start>,<end>:<file>
function! s:line_commits()
  let [firstline, lastline]=sort([line("'<"), line("'>")], 's:NumSort')
  return 'Git! log -L ' . firstline . ',' . lastline . ':%'
endfunction

function! s:NumSort(a, b)
  return a:a>a:b ? 1 : a:a==a:b ? 0 : -1
endfunction
vnoremap <silent> <F12> <Esc>:execute <SID>line_commits()<CR>

" 主に部分テンプレートファイルがどこで呼ばれているかを確認する時に
command! CalledFiles call s:called_files()
function! s:called_files()
  " _notify.html.erb => _notifyに変換する
  let current_buffer_name = fnamemodify(expand("%:p"), ":t:r:r")
  if current_buffer_name[0] == '_'
    let current_buffer_name = substitute(current_buffer_name, '_', '', '')
  endif

  let root        = FindRootDirectory()
  let views       = root . '/app/views'
  let mailers     = root . '/app/mailers'
  let controllers = root . '/app/controllers'
  let services    = root . '/app/services'
  call denite#start([{'name': 'grep', 'args': [[views, mailers, controllers, services], '', current_buffer_name]}])
endfunction

" 機能: 現カソール行がYAMLのどこのTOPノードに属されているかを調べる
" 長いYAMLを分析、編集とき、現在地はどこ？迷う時に
command! ParentNodeForYamlFile call s:find_parent_key_for_yaml()
function! s:find_parent_key_for_yaml()
  if &filetype == 'yaml'
    " カーソルがある行はすでに親になっている場合
    let s:first_character_current_line = getline('.')[0]
    if len(s:first_character_current_line) > 0 && s:first_character_current_line !~# '[ -#]'
      echo split(getline('.'), ':')[0]
      return
    endif

    " カーソル行の上の行
    let s:lnum = line('.') - 1
    while s:lnum >= 1
      let s:first_character_from_line = getline(s:lnum)[0]
      " 空白ではない行をターゲットにする
      if len(s:first_character_from_line) > 0
        if s:first_character_from_line !~# '[ -#]'
          "echo s:lnum
          "echo getline(s:lnum)
          echo split(getline(s:lnum), ':')[0]
          " 一回出力したら、中止
          break
        endif
      endif

      let s:lnum = s:lnum - 1
    endwhile

  else
    echo "FileType is not yaml"
  endif
endfunction
