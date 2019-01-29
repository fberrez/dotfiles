#!/bin/bash
#
# Defines color variables
green="\033[0;32m"
nocolor="\033[0m"
githubEmail="florent.berrez@gmail.com"

echo -e "${green}Installing brew...${nocolor}"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo -e "${green}Installing golang...${nocolor}"
brew install go

echo -e "${green}Installing dep...${nocolor}"
brew install dep

echo -e "${green}Installing atom...${nocolor}"
brew cask install atom

echo -e "${green}Installing solarized dark terminal theme...${nocolor}"
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git solarized/
open solarized/Solarized\ Dark.terminal


echo -e "${green}Installing zsh...${nocolor}"
brew install zsh

echo -e "${green}Installing oh-my-zsh...${nocolor}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "${green}Installing zsh-syntax-highlighting${nocolor}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo -e "${green}Generating a new GPG key (Github)${nocolor}"
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

# Print GPG key
#gpg --armor --export ${ID}
echo -e "${green}Generating a new SSH key (Github)${nocolor}"
ssh-keygen -t rsa -b 4096 -C ${githubEmail}
ssh-add -K ~/.ssh/id_rsa

echo -e "${green}Resolve bug which occured on signed commits${nocolor}"
brew upgrade gnupg  # This has a make step which takes a while
brew link --overwrite gnupg
brew install pinentry-mac
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
