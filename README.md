# dotfiles

**To install:**

It creates symlinks from this repo to your home folder.
It also installs `go`, `go dep`, `atom`... and creates new GPG and SSH key for git & Github.

```sh
$ make
$ chmod u+x install.sh
$ ./install.sh
```

**Git credentials:**

It sets correctly git credentials.

```sh
###
### Git credentials
###

GIT_USER_EMAIL="Email Address"
GIT_USER_NAME="Name"
GIT_GPG_PROGRAM=gpg
GIT_COMMIT_GPGSIGN=true
GIT_SIGNING_KEY=YOUR_GPG_KEY

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global gpg.program "$GIT_GPG_PROGRAM"
git config --global commit.gpgsign "$GIT_COMMIT_GPGSIGN"
git config --global user.signingkey "$GIT_SIGNING_KEY"
```

Use it with:

```sh
$ source .extra
```

**Add atom link**

```sh
$ rm /usr/local/bin/atom

$ ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom
```

**Other packages to install**

- `acpi-support` -> contains scripts to react to various ACPI events (such as screen brightness shortcuts)
- `arc-theme numix-gtk-theme numix-icon-theme` -> theme & icons

**Shortcuts to add**
- `amixer sset 'Master' 1+ toggle` -> Mute/Unmute volume
- `amixer sset 'Master' 5%-`
- `amixer sset 'Master' 5%+`
