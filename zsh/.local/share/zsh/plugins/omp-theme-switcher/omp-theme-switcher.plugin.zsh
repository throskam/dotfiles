function switch_omp_theme() {
	local theme_dir="$HOME/.config/oh-my-posh/themes"
	local selected=$(ls "$theme_dir" | fzf --prompt="Select a theme: ")

	if [[ -n "$selected" ]]; then
		local theme_path="$theme_dir/$selected"
		echo "$theme_path" > ~/.config/oh-my-posh/current-theme
		clear
		exec zsh
	fi
}
