let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/pinyin_huge.txt'
    let dbCountFile = '/misc/pinyin_huge_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'pinyinx',
                \ })
    call ZFVimIM_cloudRegister({
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_pinyin_huge_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_pinyin_huge_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_pinyin_huge_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \   'dbId' : db['dbId'],
                \ }, 'async')
endfunction

augroup ZFVimIM_pinyin_huge_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

