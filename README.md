# dotfiles



**To install:**

It creates symlinks from this repo to your home folder.

```bash
$ make
```

**Git credentials:**

It sets correctly git credentials.

```bash
###
### Git credentials
###

GIT_USER_EMAIL="Email Address"
GIT_USER_NAME="Name"
GIT_GPG_PROGRAM=gpg
GIT_COMMIT_GPGSIGN=true

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global gpg.program "$GIT_GPG_PROGRAM"
git config --global commit.gpgsign "$GIT_COMMIT_GPGSIGN"
```

Use it with:

```bash
$ source .extra
```
