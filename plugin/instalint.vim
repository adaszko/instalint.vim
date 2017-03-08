if exists("g:instalint_loaded") || &compatible || v:version < 700
    finish
endif
let g:instalint_loaded = 1


if !exists("g:instalint_filetypes")
    let g:instalint_filetypes = {}
endif


function! s:buffer_entered() " {{{
    if &filetype == "" || !has_key(g:instalint_filetypes, &filetype)
        return
    endif

    for linter in g:instalint_filetypes[&filetype]
        if linter != 'TrailingSpaces' && linter != 'TrailingSemicolons' && linter != 'Tabs' && linter != 'DuplicateAdjacentWords' && linter != 'NonbreakingSpace'
            throw printf("instalint:%s: Unknown Linter", linter)
        endif
    endfor

    for linter in g:instalint_filetypes[&filetype]
        execute printf("call instalint#EnableHighlighting%s()", linter)
    endfor
endfunction " }}}


function! s:buffer_left() " {{{
    if &filetype == "" || !has_key(g:instalint_filetypes, &filetype)
        return
    endif

    for linter in g:instalint_filetypes[&filetype]
        if linter != 'TrailingSpaces' && linter != 'TrailingSemicolons' && linter != 'Tabs' && linter != 'DuplicateAdjacentWords' && linter != 'NonbreakingSpace'
            throw printf("instalint:%s: Unknown Linter", linter)
        endif
    endfor

    for linter in g:instalint_filetypes[&filetype]
        execute printf("call instalint#DisableHighlighting%s()", linter)
    endfor
endfunction " }}}


augroup instalint
    autocmd!
    autocmd BufEnter * call s:buffer_entered()
    autocmd BufLeave * call s:buffer_left()
augroup END
