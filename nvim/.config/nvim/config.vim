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
    \ }

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onehalfdark'

" pandoc plugin
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80
