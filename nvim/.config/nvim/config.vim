" Use ripgrep instead of Ag with FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

let g:prettier#autoformat = 0

let g:ale_sh_shellcheck_change_directory = 1
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'javascript': ['eslint', 'xo'],
      \'javascript.jsx': ['eslint', 'xo'],
      \'ruby': ['sorbet', 'rubocop'],
      \'rust': ['rustfmt'],
      \'reason': ['refmt'],
      \'typescript': ['eslint'],
      \'typescript.tsx': ['eslint'],
      \'typescriptreact': ['eslint'],
      \}

let g:ale_linters = {
  \'zsh': ['shell', 'shellcheck'],
  \'typescriptreact': ['eslint', 'tsserver', 'typecheck'],
\}

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onehalfdark'
let g:airline_section_b = airline#section#create(['%{FugitiveHead()}'])

let g:airline#extensions#ale#enabled = 1
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" pandoc plugin
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80

" sneak as easy-motion
let g:sneak#label = 1

" nerd tree
" enable line numbers
let NERDTreeShowLineNumbers=1

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

let test#neovim#term_position = "vert"
let test#strategy = "neovim"

" stop deoplete automatically inserting words
set completeopt+=noselect

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
