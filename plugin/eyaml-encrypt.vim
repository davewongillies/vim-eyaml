function EyamlEncrypt()
 
 "Yank current visual selection to register x
  normal! gv"xy

  "put the content of register x through the eyaml binary and do some magic voodoo to it reg x
  let shellcmd = 'eyaml encrypt --stdin 2>&1 | grep -v "\[hiera" | grep "^string"  | cut -c9-'
  let output=system(shellcmd, @x)

  let @x = output


  "re-select area and delete
  normal! gvd

  "paste new string value back in
  normal! "xp
endfunction

map <F3> :call EyamlEncrypt() <CR>
