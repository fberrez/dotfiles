# .bash_profile is macOS's login shell script — just source .bashrc
if [ -r "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Docker Desktop (macOS)
[ -f "$HOME/.docker/init-bash.sh" ] && source "$HOME/.docker/init-bash.sh"
