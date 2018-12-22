#!/usr/bin/env bash

set -e

echo -e "Bootstraping..."
echo -e ""

case $(uname | tr '[:upper:]' '[:lower:]') in
	darwin*)
		echo -e "Installing Homebrew..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

		echo -e "Installing git..."
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
