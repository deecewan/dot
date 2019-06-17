let mapleader = ","

" Global mappings
nnoremap <silent> <leader>f :GitFiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>
"
" Normal Mode Mapping
nmap <leader>. <c-^>
" nmap <silent> <leader>x :ALENextWrap<cr>
" nmap <silent> <leader>an :ALENext<cr>
" nmap <silent> <leader>ap :ALEPrev<cr>
" nnoremap <silent> <leader>qf :ALEFix<CR>
" nnoremap <silent> K :ALEHover<CR>
" nnoremap <silent> gd :ALEGoToDefinition<CR>
" nnoremap <silent> gh :ALEFindReferences<CR>
nnoremap <silent> <leader>ql :lopen<CR>
" nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gi :call LanguageClient_textDocument_implementation()<cr>
" nnoremap <silent> g= :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call CocAction('doHover')<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" clear the search buffer with ,<space>
nnoremap <silent> <leader><space> :let @/=""<cr>
" change buffers more easily
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" increase the size of the current split with ,= (,+)
nnoremap <silent> <leader>= :vertical resize +5<cr>
" decrease the size of the current split with ,-
nnoremap <silent> <leader>- :vertical resize -5<cr>

" open the undo tree
nnoremap <silent> <leader>u :UndotreeToggle<cr>

" show open buffers with ,b
nnoremap <silent> <leader>b :Buffers<cr>

" search using ripgrep
" search with ,ll (<leader>look)
nnoremap <leader>ll :Rg<space>
" search for word under cursor with ,lw (<leader>lookword)
nnoremap <leader>lw :exec "Rg " . expand("<cword>")<cr>

" change languages
nmap <leader>cl :call Lang()<left>

" one-key delete in parentheses
onoremap p i)

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
