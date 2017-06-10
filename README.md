# vim-eyaml

A vim plugin to encrypt and decrypt eyaml.

# Requirements
* hiera-eyaml gem
* pkcs7_public_key
* pkcs7_private_key (optional, only required for decryption)
* configure ~/.eyaml/config.yaml with the path to the pkcs7 keys, eg:

```
---
pkcs7_private_key: '~/.eyaml/keys/private_key.pkcs7.pem'
pkcs7_public_key: '~/.eyaml/keys/public_key.pkcs7.pem'
```

# Usage
## To Encrypt
Use vim visual to select a string and then `:EyamlEncrypt` to have it replaced by the eyaml equivalent

## To Decrypt
Use vim visual to select a string and then `:EyamlDecrypt` to have it replaced by the eyaml equivalent
