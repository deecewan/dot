" Use ripgrep instead of Ag with FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Config for LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'ruby': ['orbaclerun', 'file-server'],
    \ }
let g:LanguageClient_waitOutputTimeout = 240

let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'javascript.jsx': ['eslint']
      \}

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onehalfdark'
let g:airline_section_b = airline#section#create(['%{FugitiveHead()}'])

" pandoc plugin
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80

" goyo + limelight
let g:goyo_with = 85
let g:goyo_linenr = 1

" javascript
let g:javascript_plugin_flow = 1

" nerd tree
" enable line numbers
let NERDTreeShowLineNumbers=1

"split join

let g:splitjoin_trailing_comma = 1
let g:splitjoin_html_attributes_bracket_on_new_line = 1
