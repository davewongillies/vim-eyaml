function! Eyaml(subcommand)

  " Yank current or last selection to register x
  normal! gv"xy

  "put the content of register x through the eyaml binary and do some magic voodoo to it reg x
  let shellcmd = 'eyaml ' . a:subcommand . ' --stdin 2>/dev/null'
  let output=system(shellcmd, @x)

  " strip newlines from output and put in register x
  let @x = substitute(output, '[\r\n]*$', '', '')

  "re-select area and paste register x
  normal! gv"xp

endfunction

function! EyamlEncrypt()
  call Eyaml('encrypt -o string')
endfunction

function! EyamlDecrypt()
  call Eyaml('decrypt')
endfunction

command! -range EyamlEncrypt call EyamlEncrypt()
command! -range EyamlDecrypt call EyamlDecrypt()
