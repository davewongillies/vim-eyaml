if exists('b:current_syntax')
    finish
endif

" Additional syntax handling for eyaml
" include periods in yaml keys
syn match  eyamlKey    "\(\w\|\.\)\+\ze\s*:"

" highlight encoded data
syn region eyamlEncode start="ENC\["          end="\]"
syn region eyamlEncode start="DEC.*::PKCS7\[" end="\]!"

" link colors
hi link eyamlKey    Identifier
hi link eyamlEncode Special

let b:current_syntax = 'yaml'
