function PresentationMode()
  colorscheme blue-mood
  set cursorline
endfunction

let js="javascript.jsx"
let f#="fsharp"
function Lang(lang)
  echo "Setting language to ".a:lang
  let &ft=a:lang
endfunction
