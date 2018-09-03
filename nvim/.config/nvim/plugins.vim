call plug#begin()
" NERDTree is a file explorer
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fszymanski/deoplete-emoji'
Plug 'junegunn/vim-emoji'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pedrohdz/vim-yaml-folds'
" render syntax for zplug correctly
Plug 'zplug/vim-zplug'
Plug 'justinmk/vim-sneak'
" such a great thing for splitting/joining lines
Plug 'AndrewRadev/splitjoin.vim'
" set up for latex + pandoc
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" set up for writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
call plug#end()
