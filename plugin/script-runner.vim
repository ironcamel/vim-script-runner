" Run perl, python, ruby, bash, etc. scripts from within vim.
" Maintainer: Naveed Massjouni <https://github.com/ironcamel/vim-script-runner>
" Version: 0.0.1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Change can be found in comment section: 
" " xxx {{{
"   xxxxxxxxxxxxxxxxxxxxxxxx
" " }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if !exists('g:script_runner_key')
    let g:script_runner_key = '<F5>'
endif
execute "nnoremap <silent> ".g:script_runner_key." :silent call Run(&ft)<CR>"
" insert mode can run {{{
execute "inoremap <silent> ".g:script_runner_key." <Esc>:silent call Run(&ft)<CR>"
" }}}
cabbrev sx call Run(&ft)
cabbrev pyx call Run('python')
cabbrev perlx call Run('perl')
cabbrev rubyx call Run('ruby')
cabbrev phpx call Run('php')

let s:ft_cmd = {
    \'json' : 'json_pp',
    \'xml'  : 'xmllint --format -',
\}

autocmd BufEnter *.json set ft=json

fu! NewThrowawayBuffer()
    new
    " new win features {{{
    setlocal noreadonly
    setlocal modifiable
    " setlocal nonumber
    " setlocal cursorline
    setlocal filetype=runner
    setlocal nobuflisted
    setlocal nolist
    setlocal nospell
    setlocal nowrap
    setlocal nofoldenable
    setlocal foldcolumn=1
    " }}}
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
    map <buffer> <silent> q :quit<CR>
    " redraw!
endf

fu! Run(cmd)
    " change pwd {{{
    let s:pwd = getcwd()
    exe 'cd %:p:h'
    " }}}

    " let s:real_cmd = a:cmd
    " let plugin 'vim-laravel4-snippets' {{{
    let s:real_cmd = substitute(a:cmd, '.laravel', '', '') 
    " }}}

    if(exists("g:script_runner_".a:cmd))
        " Use the users custom setting
        execute "let s:real_cmd = g:script_runner_".a:cmd
    elseif(has_key(s:ft_cmd, a:cmd))
        " Use our default, if there is one
        let s:real_cmd = s:ft_cmd[a:cmd]
    endif

    only
    %y
    call NewThrowawayBuffer()
    wincmd J
    " change height {{{
    resize 12
    " }}}
    0 put
    exe '%!' . s:real_cmd
    0 read !date
    append
------------------------------------
.
    " some win features {{{
    setlocal readonly
    setlocal nomodifiable
    " }}}
    wincmd w
    " recover pwd {{{
    exe 'cd ' . s:pwd
    " }}}
endf
