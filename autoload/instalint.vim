function! instalint#IsHighlighted(group) " {{{ Returns 0- or 1-element list
    return filter(getmatches(), 'v:val.group == "' . a:group . '"')
endfunction " }}}

function! instalint#EnableHighlighting(group, regex) " {{{
    let entries = instalint#IsHighlighted(a:group)
    if len(entries) == 0
        execute 'highlight' a:group 'ctermbg=red guibg=red'
        call matchadd(a:group, a:regex)
    endif
endfunction " }}}

function! instalint#DisableHighlighting(group) " {{{
    let entries = instalint#IsHighlighted(a:group)
    if len(entries) > 0
        let entry = entries[0]
        call matchdelete(entry.id)
    endif
endfunction " }}}

function! instalint#EnableHighlightingTrailingSpaces() " {{{
    call instalint#EnableHighlighting('TrailingSpaces', '\v\s+$')
endfunction " }}}

function! instalint#DisableHighlightingTrailingSpaces() " {{{
    call instalint#DisableHighlighting('TrailingSpaces')
endfunction " }}}

function! instalint#EnableHighlightingTrailingSemicolons() " {{{
    call instalint#EnableHighlighting('TrailingSemicolons', '\v;+$')
endfunction " }}}

function! instalint#DisableHighlightingTrailingSemicolons() " {{{
    call instalint#DisableHighlighting('TrailingSemicolons')
endfunction " }}}

function! instalint#EnableHighlightingTabs() " {{{
    call instalint#EnableHighlighting('Tabs', '\v\t+')
endfunction " }}}

function! instalint#DisableHighlightingTabs() " {{{
    call instalint#DisableHighlighting('Tabs')
endfunction " }}}

function! instalint#EnableHighlightingDuplicateAdjacentWords() " {{{
    call instalint#EnableHighlighting('DuplicateAdjacentWords', '\c\v<(\S+)\_\s+\1>')
endfunction " }}}

function! instalint#DisableHighlightingDuplicateAdjacentWords() " {{{
    call instalint#DisableHighlighting('DuplicateAdjacentWords')
endfunction " }}}

function! instalint#EnableHighlightingNonbreakingSpace() " {{{
    call instalint#EnableHighlighting('NonbreakingSpace', '\%xA0')
endfunction " }}}

function! instalint#DisableHighlightingNonbreakingSpace() " {{{
    call instalint#DisableHighlighting('NonbreakingSpace')
endfunction " }}}
