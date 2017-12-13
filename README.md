# vim-eyaml ![](https://img.shields.io/github/license/davewongillies/vim-eyaml.svg)

A vim plugin to encrypt and decrypt eyaml.

# Requirements
* [hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml) gem

## Optional for pkcs7 encryption
* a pkcs7_public_key (if using PKCS7 encryption)
* a pkcs7_private_key (optional, only required for decryption)

## Optional for GPG encryption
* Your gpg keys you'll be encrypting/decrypting with
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
or in `~/.vimrc`
```vim
let g:eyaml_encryption_method: 'gpg'
```

If you do not have a web of trust (i.e. you normally use --always-trust for gpg signing) then you'll need to `g:eyaml_gpg_always_trust` to `1`.
```vim
let g:eyaml_gpg_always_trust = 1
```
By default if you don't set `g:eyaml_gpg_recipients` or `g:eyaml_gpg_recipients_file`, the plugin will search for the recipients file `hiera-eyaml-gpg.recipients` in the current directory, then will search downwards until it finds the file.
```vim
" Set one or the other, not both
let g:eyaml_gpg_recipients = 'someguy@gmail.com'
" let g:eyaml_gpg_recipients_file = 'hiera-eyaml-gpg.recipients'
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
