
function! havetermsay#HaveTermSay(termname,what)
    let l:txname = toupper(a:termname)
    if match(serverlist(),l:txname) == -1
        call system("start /B gvim.exe --servername ".l:txname)
        sleep 333m
        call remote_send(l:txname,":term ++curwin<cr>")
        augroup CleanupActions
            au!
            exe printf("au VimLeave * :call remote_send(\"%s\",\"<c-w>:qa!<cr>\")",l:txname)
        augroup END
    endif
    call remote_send(l:txname,"start \"\" " .a:what . "<cr>")
endfunction

