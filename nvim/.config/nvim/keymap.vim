let mapleader = ","

" Global mappings
nnoremap <silent> <leader>f :GitFiles<CR>
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>s :Snippets<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>
"
" Normal Mode Mapping
nmap <leader>. <c-^>
nmap <silent> ]c :ALENextWrap<cr>
nmap <silent> [c :ALEPrevWrap<cr>
nnoremap <silent> <leader>qf :ALEFix<CR>
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gh :ALEFindReferences<CR>
nnoremap <silent> <leader>ql :lopen<CR>

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

nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tv :TestVisit<CR>


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
