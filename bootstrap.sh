#!/usr/bin/env bash

set -e

echo -e "Bootstraping..."
echo -e ""

case $(uname | tr '[:upper:]' '[:lower:]') in
	darwin*)
		echo -e "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"

		# This is necessary to run sh commands.
		echo -e "Installing coreutils and findutils..."
		brew install coreutils
		brew install findutils
		brew install git
		;;
	*)
		echo -e "Installing git..."
		sudo apt-get install git
		;;
esac

# Link dotfiles before anything being installed to avoid conflicts with defaults.
echo -e "Cloning dotfiles..."
git clone git@github.com:throskam/dotfiles.git .dotfiles

case $(uname | tr '[:upper:]' '[:lower:]') in
	darwin*)
		.dotfiles/setup-mac.sh
		;;
	*)
		.dotfiles/setup-linux.sh
		;;
esac
