" Use ripgrep instead of Ag with FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" " Config for LanguageClient
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['./node_modules/.bin/flow', 'lsp'],
"     \ 'javascript.jsx': ['./node_modules/.bin/flow', 'lsp'],
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ }
" let g:LanguageClient_waitOutputTimeout = 240

" call ale#Set('rust_cargo_use_clippy', 1)
" let g:ale_fixers = {
"       \'javascript': ['eslint', 'xo'],
"       \'javascript.jsx': ['eslint', 'xo'],
"       \'ruby': ['rubocop'],
"       \'rust': ['rustfmt'],
"       \'reason': ['refmt'],
"       \'typescript': ['eslint'],
      " \}

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onehalfdark'
let g:airline_section_b = airline#section#create(['%{FugitiveHead()}'])

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" pandoc plugin
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80

" sneak as easy-motion
let g:sneak#label = 1

" javascript
let g:javascript_plugin_flow = 1

" nerd tree
" enable line numbers
let NERDTreeShowLineNumbers=1

" function! FindProjectRoot(buffer) abort
"     let l:reason_config = ale#path#FindNearestFile(a:buffer, 'bsconfig.json')

"     if !empty(l:reason_config)
"         return fnamemodify(l:reason_config, ':h')
"     endif

"     return ''
" endfunction

" call ale#linter#Define('reason', {
" \   'name': 'reason-language-server',
" \   'lsp': 'stdio',
" \   'executable':{buffer -> ale#Var(buffer, 'reason_ls_executable')},
" \   'command': '%e',
" \   'project_root': function('FindProjectRoot'),
" \   'language': 'reason',
" \})

" let g:ale_reason_ls_executable = $HOME.'/.config/reason-language-server/reason-language-server.exe'

" ultisnips
" split the edit window vertically
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips/']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-q>"
let g:UltiSnipsJumpForwardTrigger="<C-a>"

"split join

let g:splitjoin_trailing_comma = 1
let g:splitjoin_html_attributes_bracket_on_new_line = 1

" ruby
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_rails = 1

" stop deoplete automatically inserting words
set completeopt-=noselect

" java shit
autocmd FileType java setlocal omnifunc=javacomplete#Complete
