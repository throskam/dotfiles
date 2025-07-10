function open_tmux_project() {
	local projects_dir="$HOME/Projects"
	local selected
	local project_name
	local session_name
	local projects

	projects=$(find "$projects_dir" -mindepth 1 -maxdepth 3 -type d -name ".git" | sed 's|/\.git||')

	projects="$projects"$'\n'"$HOME/.dotfiles"$'\n'"$HOME"

	selected=$(echo "$projects" | fzf --prompt="Select a project: ")

	# Exit if none selected
	[[ -z "$selected" ]] && return 1

	project_name=$(basename "$selected")
	session_name="${project_name//[^a-zA-Z0-9]/-}"

	if [[ -n "$TMUX" ]]; then
		if tmux has-session -t "$session_name" 2>/dev/null; then
			tmux switch-client -t "$session_name"
		else
			tmux new-session -ds "$session_name" -c "$selected"
			tmux switch-client -t "$session_name"
		fi
	else
		if tmux has-session -t "$session_name" 2>/dev/null; then
			tmux attach-session -t "$session_name"
		else
			tmux new-session -s "$session_name" -c "$selected"
		fi
	fi
}
