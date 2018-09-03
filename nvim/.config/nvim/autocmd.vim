" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" Run prettier on write
" autocmd BufWritePre *.js,*.jsx silent ![[ -f .prettierrc ]] && yarn prettier %
" use Ruby for Fastlane files
autocmd BufNewFile,BufRead Fastfile set ft=ruby
" use JSON for .babelrc
autocmd BufNewFile,BufRead .babelrc set ft=json

" in insert mode, we change to the current directory for better name
" completion
:autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
:autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
