call plug#begin("~/dotfiles/nvim/.config/nvim/plugged")
" NERDTree is a file explorer
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-endwise'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" themes go here
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'rainglow/vim'
Plug 'liuchengxu/space-vim-theme'
" render syntax for zplug correctly
Plug 'zplug/vim-zplug'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
" such a great thing for splitting/joining lines
Plug 'AndrewRadev/splitjoin.vim'
" set up for latex + pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" ruby
Plug 'tpope/vim-rails'
Plug 'ruby-formatter/rufo-vim'
" very cool undo tree
Plug 'mbbill/undotree'
" autoformat everything
Plug 'Chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'machakann/vim-highlightedyank'
Plug 'janko-m/vim-test'
Plug 'ap/vim-css-color'

Plug 'qpkorr/vim-renamer'
call plug#end()
