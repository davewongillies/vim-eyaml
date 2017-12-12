function! Eyaml(subcommand)
  " Yank current or last selection to register x
  normal! gv"xy

  "put the content of register x through the eyaml binary and do some magic voodoo to it reg x
  let l:shellcmd = 'eyaml ' . a:subcommand . ' --stdin 2>/dev/null'
  let l:output=system(l:shellcmd, @x)

  " strip newlines from output and put in register x
  let @x = substitute(l:output, '[\r\n]*$', '', '')

  "re-select area and paste register x
  normal! gv"xp

endfunction

function! EyamlEncrypt()
  let g:eyaml_args = ''
  " Default to pkcs7
  if !exists('g:eyaml_encryption_method')
      let g:eyaml_encryption_method = 'pkcs7'
  endif

  if g:eyaml_encryption_method ==# 'gpg'
      if exists('g:eyaml_gpg_recipients')
          let g:eyaml_args = ' --gpg-recipients='. g:eyaml_gpg_recipients
      else
          if exists('g:eyaml_gpg_recipients_file')
              let l:eyaml_gpg_recipients_file = findfile(g:eyaml_gpg_recipients_file, '*;/')
          else
              let l:eyaml_gpg_recipients_file = findfile('hiera-eyaml-gpg.recipients', '*;/')
          end
          let g:eyaml_args = ' --gpg-recipients-file=' . l:eyaml_gpg_recipients_file
      endif

      if g:eyaml_gpg_always_trust == 1
          let g:eyaml_args = g:eyaml_args . ' --gpg-always-trust'
      endif
  endif

  let g:eyaml_args = g:eyaml_args . ' -n ' . g:eyaml_encryption_method

  call Eyaml('encrypt -o string ' . g:eyaml_args)

endfunction

function! EyamlDecrypt()
  call Eyaml('decrypt')
endfunction

command! -range EyamlEncrypt call EyamlEncrypt()
command! -range EyamlDecrypt call EyamlDecrypt()
