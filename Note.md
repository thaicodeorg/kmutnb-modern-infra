# Github 

```bash 
# .ssh/config

Host github.com-thaicode
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_thaicode

```
# Git login
```
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa_thaicode
ssh -T git@github.com-thaicode
git push origin main
```