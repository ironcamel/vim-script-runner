nmap <F5> :call Run()<CR>
cabbrev sx call Run()

let s:ft_cmd = {
    \'perl'   : '%!perl',
    \'ruby'   : '%!ruby',
    \'python' : '%!python',
\}

fu! NewThrowawayBuffer()
    new
    setlocal noswapfile
    setlocal buftype=nowrite
    setlocal bufhidden=delete
endfu

fu! Run()
    let s:filetype = &ft
    if(has_key(s:ft_cmd, s:filetype))
        only
        %y
        call NewThrowawayBuffer()
        wincmd J
        resize 15
        put
        silent! exe s:ft_cmd[ s:filetype ]
        0 read !date
        append
---
.
        wincmd w
    else
        echo 'The filetype ' . s:filetype . ' is not supported at this point.'
    endif
endfu
