" 特定のコミットから、BitBucketのPRを探す出す。
" 数複リポジトリに対応した(2019-02-23)
" 条件: コミットメッセージにjiraチケット番号が含まれていること( チケット駆動 )
command! -nargs=0 PR call s:goto_pr()
function! s:goto_pr()
  let l:word = expand("<cword>")
  let l:result_for_commit_message = system('git log -n 1 --pretty=format:%s ' . l:word)
  echo 'Current Commit Message:' l:word . ' ' . l:result_for_commit_message

  " \c をパターンに含めるとパターン全体で大文字と小文字の違いが無視されるようになる
  let l:pattern = '\c\(' . $JIRA_PROJETC1_NAME . '\|' . $JIRA_PROJETC2_NAME . '\|' . $JIRA_PROJETC4_NAME . '\)-[0-9]\+'
  let l:jira_no = matchlist(l:result_for_commit_message, l:pattern)

  if !empty(l:jira_no)
    echo "JIRA: https://" . $URL_PREFIX . ".atlassian.net/browse/" . l:jira_no[0]
  else
    echo "Cann't found JIRA the ticket!!!"
    return
  endif

  let l:result_commit_hash_before_merge = system('git showpr ' . l:word)
  let l:pr_no = matchlist(l:result_commit_hash_before_merge, 'pull request #\([0-9]\+\)')

  if !empty(l:pr_no)
    echo 'Merge Commit Message: ' . l:result_commit_hash_before_merge

    let l:target_project_name = s:get_target_repository_name(l:jira_no)
    if !empty(l:target_project_name)
      echo "PR: https://bitbucket.org/" . l:target_project_name . "/pull-requests/" . l:pr_no[1]
    else
      echo "Cann't found the PR!!"
    endif
  else
    echo "Cann't found the PR!!"
  endif
endfunction

function! s:get_target_repository_name(jira_no)
  if a:jira_no[1] == $JIRA_PROJETC1_NAME
    return s:get_target_repository_name2()
  elseif a:jira_no[1] == $JIRA_PROJETC2_NAME
    return $BITBUCKET_REPOSITORY2_NAME
  elseif a:jira_no[1] == $JIRA_PROJETC4_NAME
    return $BITBUCKET_REPOSITORY4_NAME
  else
    echo "Cann't found the target repository name."
  endif
endfunction

" jiraチケットは複数のリポジトリを持っている時に使用(大体リニューアルする時に)
function! s:get_target_repository_name2()
  let l:repo_name = split(getcwd(),'/')[-1]

  if $BITBUCKET_REPOSITORY1_NAME =~ l:repo_name . "$"
    return $BITBUCKET_REPOSITORY1_NAME
  elseif $BITBUCKET_REPOSITORY3_NAME =~ l:repo_name . "$"
    return $BITBUCKET_REPOSITORY3_NAME
  end
endfunction
