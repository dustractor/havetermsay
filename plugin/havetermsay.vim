if exists('g:havetermsay') | finish | endif

let g:havetermsay = 1

command! -nargs=+ Havetermsay call havetermsay#HaveTermSay(<f-args>)


