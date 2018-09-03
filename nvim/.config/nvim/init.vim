" allow pretty colors in the terminal
set termguicolors
" allow hidden buffers - can background a changed buffer
set hidden
" a tab looks like 2 spaces
set tabstop=2
" we move forward + backward by 2 spaces at a time
set shiftwidth=2
" convert the <Tab> to spaces
set expandtab
" show numbers relatively
set relativenumber
" show the current line absolutely
set number
" set sensible split defaults
set splitbelow
set splitright
" set code columns
set cc=80,100
" fold based on syntax
set foldmethod=syntax
" turn on undofile for heaps long undos
set undofile

let g:fsharpbinding_debug = 1
let g:fsharp_completion_helptext = 1

" bring in external config files
runtime autocmd.vim
runtime plugins.vim
runtime config.vim
runtime keymap.vim

" after loading all my things, load a local .vimrc if present
if filereadable(glob("./.vimrc"))
  source ./.vimrc
endif

" use a pretty theme
colorscheme onehalfdark

hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
