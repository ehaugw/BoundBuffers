if exists("g:loaded_bound_buffers")
    finish
endif
let g:loaded_bound_buffers = 1

nnoremap <silent> g. :call BoundBuffers#Bnext()<CR>
nnoremap <silent> g, :call BoundBuffers#Bprev()<CR>
nnoremap <silent> <leader>q :call BoundBuffers#Bquit()<cr>
nnoremap <silent> <leader>QQ :call BoundBuffers#Bquit(1)<cr>
