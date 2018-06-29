" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" Run prettier on write
" autocmd BufWritePre *.js,*.jsx silent ![[ -f .prettierrc ]] && yarn prettier %
" use Ruby for Fastlane files
autocmd BufNewFile,BufRead Fastfile set ft=ruby
