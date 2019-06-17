call plug#begin()
" NERDTree is a file explorer
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'w0rp/ale'
" Plug 'reasonml-editor/vim-reason-plus'
" Going to see if ALE is enough for my needs
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-endwise'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'reasonml-editor/vim-reason-plus'
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
" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'jxnblk/vim-mdx-js'
" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ruby-formatter/rufo-vim'
" very cool undo tree
Plug 'mbbill/undotree'
" autoformat everything
Plug 'Chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'machakann/vim-highlightedyank'
Plug 'janko-m/vim-test'
Plug 'leafgarland/typescript-vim'
call plug#end()
