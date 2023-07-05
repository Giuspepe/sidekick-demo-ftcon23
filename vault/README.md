# Sd Vault

This vault contains gpg encrypted passwords and certificates.

To get the password to the vault ask one of the administrators.

This password is available on CI as environment variable `SD_VAULT_PASSPHRASE`.

## List existing secrets

```
sd vault list
```

## Encrypt secrets

```
sd vault encrypt file.csv
```

## Decrypt secrets

```
sd vault decrypt file.csv.gpg
```
    