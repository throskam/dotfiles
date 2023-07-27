function stowsh
	pushd .
	cd ~
	.dotfiles/stowsh .dotfiles/$argv[1] -s
	popd
end
