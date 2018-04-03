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

" bring in external config files
runtime plugins.vim
runtime config.vim
runtime keymap.vim

" use a pretty theme
colorscheme onehalfdark

