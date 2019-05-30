# Make `.bashrc` more resilient. `.bash_profile` is a specific MacOS script which replaces `.bashrc`.
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
