function stowsh() {
	pushd .
	cd ~
	.dotfiles/stowsh .dotfiles/$1 -s
	popd
}
