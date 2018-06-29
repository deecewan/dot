let mapleader = ","

" Global mappings
map <silent> <leader>f :GitFiles<CR>
map <silent> <leader>F :Files<CR>
map <silent> <leader>n :NERDTreeToggle<CR>
map <silent> <leader>N :NERDTreeFind<CR>
map <silent> <leader>x :ALENextWrap<CR>

" Normal Mode Mapping
nmap <leader>. <c-^>
nmap <silent> <leader>p :ALENextWrap<cr>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> g= :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" clear the search buffer with ,<space>
nnoremap <silent> <leader><space> :let @/=""<cr>
" change buffers more easily
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" show open buffers with ,b
nnoremap <silent> <leader>b :Buffers<cr>

" search using ripgrep
" search with ,ll (<leader>look)
nnoremap <leader>ll :Rg<space>
" search for word under cursor with ,lw (<leader>lookword)
nnoremap <leader>lw :exec "Rg " . expand("<cword>")<cr>
