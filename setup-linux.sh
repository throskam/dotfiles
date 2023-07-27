#!/bin/bash

set -e

SCRIPT_DIR="$(dirname $0)"

STOW_PACKAGES=(
	ag
	bash
	bin
	fish
	fonts
	git
	npm
	omf
	screen
	vim
)

APT_PACKAGES=(
	bat
	build-essential
	curl
	httpie
	fish
	silversearcher-ag
	gnome-tweaks
	vim-gtk3
	jq
)

APT_DEB=(
	https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	https://downloads.slack-edge.com/linux_releases/slack-desktop-4.11.1-amd64.deb
	"https://discordapp.com/api/download?platform=linux&format=deb"
)

NODE_PACKAGES=(
	tldr
)

source $SCRIPT_DIR/colors.sh

echo -e "${c_b_g}Setting up ${c_b_y}Linux${c_b_g}...${c_reset}"

for PACKAGE in "${STOW_PACKAGES[@]}"
do
	echo -e "${c_r_g}Stowing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	"$SCRIPT_DIR/stowsh" -s -v "$SCRIPT_DIR/$PACKAGE"
done

for PACKAGE in "${APT_PACKAGES[@]}"
do
	echo -e "${c_r_g}Installing ${c_r_y}$PACKAGE${c_r_g}...${c_reset}"
	sudo apt install $PACKAGE -y
done

for DEB in "${APT_DEB[@]}"
do
	echo -e "${c_r_g}Installing ${c_r_y}$DEB${c_r_g}...${c_reset}"
	wget $DEB -O package.deb
	sudo dpkg -i package.deb || true
	sudo apt -f install
	rm package.deb
done

echo -e "${c_r_g}Installing ${c_r_y}nvm${c_r_g}...${c_reset}"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

echo -e "${c_r_g}Installing ${c_r_y}omf${c_r_g}...${c_reset}"
curl -L https://get.oh-my.fish > install-omf.fish
fish install-omf.fish --noninteractive
rm install-omf.fish

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
chsh -s /usr/bin/fish
