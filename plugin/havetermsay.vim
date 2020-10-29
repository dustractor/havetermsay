if exists('g:havetermsay') | finish | endif

let g:havetermsay = 1


function! s:HaveTermSay(termname,what)
    echom a:termname . "<--"
    if match(serverlist(),toupper(a:termname)) == -1
        " call system("start /min gvim.exe --servername " . a:termname)
        call system("start gvim.exe --servername " . a:termname)
        sleep 777m
        call remote_send(a:termname,":term ++curwin<cr>")
        augroup CleanupActions
            au!
            exe printf("au VimLeave * :call remote_send(\"%s\",\"<c-w>:qa!<cr>\")",a:termname)
        augroup END
    endif
    call remote_send(a:termname,a:what)
    call remote_send(a:termname,"<cr>")
endfunction

command! -nargs=+ Havetermsay call s:HaveTermSay(<f-args>)


