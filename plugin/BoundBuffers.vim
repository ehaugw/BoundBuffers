if exists("g:loaded_bound_buffers")
    finish
endif
let g:loaded_bound_buffers = 1

nnoremap <silent> <tab> :call BoundBuffers#Bnext()<CR>
nnoremap <silent> <s-tab> :call BoundBuffers#Bprev()<CR>
"
" Keybindings to close buffer in window
nnoremap <silent> <leader>q :call BoundBuffers#Bquit()<cr>
nnoremap <silent> <leader>QQ :call BoundBuffers#Bquit(1)<cr>
