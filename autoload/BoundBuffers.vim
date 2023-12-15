" Previous unopened buffer
function! BoundBuffers#Bprev() abort
    if match(bufname('%'), 'NERD_tree_\d') == 0
        echom('Tabbing out of NERDTree has been disabled')
    else
        let start_buffer = bufnr('%')
        let tries = 0
        bprevious
        while len(win_findbuf(bufnr('%'))) > 1 && tries < 999 && bufnr('%') != start_buffer
            let tries = tries + 1
            bprevious
        endwhile
        if bufnr('%') == start_buffer
            echom('No other unopened buffers')
        endif
    endif
endfunction

" Previous unopened buffer
function! BoundBuffers#Bnext() abort
    if match(bufname('%'), 'NERD_tree_\d') == 0
        echom('Tabbing out of NERDTree has been disabled')
    else
        let start_buffer = bufnr('%')
        let tries = 0
        bnext
        while len(win_findbuf(bufnr('%'))) > 1 && tries < 999 && bufnr('%') != start_buffer
            let tries = tries + 1
            bnext
        endwhile
        if bufnr('%') == start_buffer
            echom('No other unopened buffers')
        endif
    endif
endfunction

function! BoundBuffers#Bquit(...) abort
    if match(bufname('%'), 'NERD_tree_\d') == 0
        q
    else
        let force = (a:0 > 0 ? a:1 : 0) || (&ma == 0)
        if &mod == 1 && force == 0
            echom('No write since last change')
        else
            let buffer_to_be_closed = bufnr('%')
            call BoundBuffers#Bprev()
            if len(win_findbuf(bufnr(buffer_to_be_closed))) > 0
                enew
            end
            if len(win_findbuf(bufnr(buffer_to_be_closed))) == 0
                if force == 1
                    exec "bd!" . buffer_to_be_closed
                else
                    exec "bd" . buffer_to_be_closed
                endif
            endif
        endif
    endif
endfunction
