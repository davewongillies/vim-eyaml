function EyamlEncrypt()
 
  " Yank current or last selection to register x
  normal! gv"xy

  "put the content of register x through the eyaml binary and do some magic voodoo to it reg x
  let shellcmd = 'eyaml encrypt --stdin 2>&1 | grep -v "\[hiera" | grep "^string"  | cut -c9-'
  let output=system(shellcmd, @x)

  " strip newlines from output and put in register x
  let @x = substitute(output, '[\r\n]*$', '', '')

  "re-select area and paste register x
  normal! gv"xp

endfunction

map <F3> :call EyamlEncrypt() <CR>
