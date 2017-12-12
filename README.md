# vim-eyaml ![](https://img.shields.io/github/license/davewongillies/vim-eyaml.svg)

A vim plugin to encrypt and decrypt eyaml.

# Requirements
* [hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml) gem
* a pkcs7_public_key (if using PKCS7 encryption)
* a pkcs7_private_key (optional, only required for decryption)

# Optional
* [hiera-eyaml-gpg](https://github.com/sihil/hiera-eyaml-gpg) gem (if using gpg encryption)

# Installation

Install using your favourite vim plugin manager such as vundle:
`~/.vimrc`
```
Plugin 'davewongillies/vim-eyaml'
```

## PKCS7 encryption

If you're using PKCS7 encryption, configure `~/.eyaml/config.yaml` with the path to the pkcs7 keys

`~/.eyaml/config.yaml`
```yaml
---
encrypt_method: pkcs7
pkcs7_private_key: '~/.eyaml/keys/private_key.pkcs7.pem'
pkcs7_public_key: '~/.eyaml/keys/public_key.pkcs7.pem'
```

## GPG encryption
If you're using GPG encryption, set `encrypt_method` to `gpg`:
`~/.eyaml/config.yaml`
```yaml
---
encrypt_method: gpg
```

`~/.vimrc`
```yaml
let g:eyaml_encryption_method: "gpg"

" Optional settings
" let g:eyaml_gpg_always_trust = 1

" Set one or the other, not both
" If you don't set either, the plugin with search for hiera-eyaml-gpg.recipients
" let g:eyaml_gpg_recipients_file = "hiera-eyaml-gpg.recipients"
" let g:eyaml_gpg_recipients = 'someguy@gmail.com'
```


# Usage
## To Encrypt
Use vim visual to select a string and then `:EyamlEncrypt` to have it replaced by the eyaml equivalent

## To Decrypt
Use vim visual to select a string and then `:EyamlDecrypt` to have it replaced by the eyaml equivalent

# Authors & Contributors
* Jonah Meijers
* Arthur Holstvoog
* David Gillies
