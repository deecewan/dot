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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fszymanski/deoplete-emoji'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
" render syntax for zplug correctly
Plug 'zplug/vim-zplug'
" such a great thing for splitting/joining lines
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()
