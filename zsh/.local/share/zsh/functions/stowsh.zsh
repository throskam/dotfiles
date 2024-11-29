function stowsh() {
	emulate -L zsh
	pushd .
	cd ~
	.dotfiles/stowsh .dotfiles/$1 -s
	popd
}
