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

" fugitive open in quickfix
autocmd QuickFixCmdPost *status* cwindow

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" check for parse errors with ruby
autocmd FileType ruby compiler ruby

autocmd CursorHold * silent call CocActionAsync('highlight')
