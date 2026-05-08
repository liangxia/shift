Copy GPG key to another machine to use the same key there. Here is how:
1. Identify your private key:
`gpg --list-secret-keys user@example.com`
Example output:
```
sec   rsa4096 2020-02-18 [SC]
      ID******
uid           [ultimate] Your Name <user@example.com>
ssb   rsa4096 2020-02-18 [E]
```
Remember the ID of your key (second column. e.g. "ID******"). If you have a "sub" entry, you can ignore it.
2. Run this command to export your key:
`gpg --export-secret-keys YOUR_ID_HERE > private.key`
3. Copy the key file to the other machine using a secure transport.
4. To import, run
`gpg --import private.key`
If the key already exist on the second machine, the import will succeed saying "not changed".
To force import, you will have to delete both the private and public key first (`gpg --delete-keys` and `gpg --delete-secret-keys`).
