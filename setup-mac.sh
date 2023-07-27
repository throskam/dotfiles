#!/bin/bash

set -e

SCRIPT_DIR="$(dirname $0)"

STOW_PACKAGES=(
	ag
	bin
	fish
	git
	npm
	omf
	vim
)

BREW_PACKAGES=(
	bat
	fish
	gron
	httpie
	jq
	nvm
	the_silver_searcher
	tmux
	vim
)

BREW_CASK_PACKAGES=(
)

NODE_PACKAGES=(
	tldr
)

source $SCRIPT_DIR/colors.sh

echo -e "${c_b_g}Setting up ${c_b_y}Mac${c_b_g}...${c_reset}"

for PACKAGE in "${STOW_PACKAGES[@]}"
do
	echo -e "${c_r_g}Stowing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	"$SCRIPT_DIR/stowsh" -s -v "$SCRIPT_DIR/$PACKAGE"
done

for PACKAGE in "${BREW_PACKAGES[@]}"
do
	echo -e "${c_r_g}Installing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	brew install $PACKAGE
done

for PACKAGE in "${BREW_CASK_PACKAGES[@]}"
do
	echo -e "${c_r_g}Installing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	brew cask install $PACKAGE
done

echo -e "${c_r_g}Installing ${c_r_y}omf${c_r_g}...${c_reset}"
curl -L https://get.oh-my.fish | fish

echo -e "${c_r_g}Installing ${c_r_y}omf bundles${c_r_g}...${c_reset}"
echo "omf install" | fish

echo -e "${c_r_g}Installing ${c_r_y}latest node${c_r_g}...${c_reset}"
echo "nvm install node" | fish

for PACKAGE in "${NODE_PACKAGES[@]}"
do
	echo -e "${c_r_g}Installing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	echo "npm install -g $PACKAGE" | fish
done

echo -e "${c_r_g}Setting default shell to fish...${c_reset}"
chsh -s /opt/homebrew/bin/fish

echo -e "${c_r_g}Setting homebrew in fish...${c_reset}"
fish -c "set -l IFS; and echo (/opt/homebrew/bin/brew shellenv); and set -e IFS" >> /Users/
