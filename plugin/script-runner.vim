" Run perl, python, ruby, bash, etc. scripts from within vim.
" Maintainer: Naveed Massjouni <https://github.com/ironcamel/vim-script-runner>
" Version: 0.0.1

nmap <F5> :call Run(&ft)<CR>
cabbrev sx call Run(&ft)
cabbrev pyx call Run('python')
cabbrev perlx call Run('perl')
cabbrev rubyx call Run('ruby')

fu! NewThrowawayBuffer()
    new
    setlocal noswapfile
    setlocal buftype=nowrite
    setlocal bufhidden=delete
    map <buffer> q :quit<CR>
endf

fu! Run(cmd)
    only
    %y
    call NewThrowawayBuffer()
    wincmd J
    resize 15
    0 put
    exe "%!" . a:cmd
    0 read !date
    append
----------------------------
.
    wincmd w
endf
