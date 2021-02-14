" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" Run prettier on write
" autocmd BufWritePre *.js,*.jsx silent ![[ -f .prettierrc ]] && yarn prettier %
" use Ruby for Fastlane files
autocmd BufNewFile,BufRead Fastfile set ft=ruby
" use JSON for .babelrc
autocmd BufNewFile,BufRead .babelrc set ft=json

autocmd BufNewFile,BufRead *.tsx set ft=typescript.tsx

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

" autocmd CursorHold * silent call CocActionAsync('highlight')

" java shit
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" autocmd BufRead,BufNewFile */up/api/* let b:ale_javascript_eslint_executable="~/projects/ferocia/up/api/node_modules/.bin/eslint"
" autocmd BufRead,BufNewFile */up/api/* let b:ale_javascript_flow_executable="~/projects/ferocia/up/api/node_modules/.bin/flow"
" autocmd BufRead,BufNewFile */up/api/* let b:ale_javascript_flow_ls_executable="~/projects/ferocia/up/api/node_modules/.bin/flow"
" autocmd BufRead,BufNewFile */up/api/* let b:ale_javascript_prettier_executable="~/projects/ferocia/up/api/node_modules/.bin/prettier"
" autocmd BufRead,BufNewFile */up/native/* let b:ale_javascript_eslint_executable="~/projects/ferocia/up/native/node_modules/.bin/eslint"
" autocmd BufRead,BufNewFile */up/native/* let b:ale_javascript_flow_executable="~/projects/ferocia/up/native/node_modules/.bin/flow"
" autocmd BufRead,BufNewFile */up/native/* let b:ale_javascript_flow_ls_executable="~/projects/ferocia/up/native/node_modules/.bin/flow"
" autocmd BufRead,BufNewFile */up/native/* let b:ale_javascript_prettier_executable="~/projects/ferocia/up/native/node_modules/.bin/prettier"
autocmd BufRead,BufNewFile */up/* let b:ale_linters = {
  \'ruby': ['brakeman', 'rails_best_practices', 'reek', 'ruby', 'sorbet', 'standardrb'],
  \'javascript': ['eslint', 'flow', 'flow-language-server', 'prettier']
\}
autocmd BufRead,BufNewFile */up/* let b:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
  \'javascript': ['eslint', 'prettier'],
  \'ruby': ['sorbet'],
\}
