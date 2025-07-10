# Enable history
HISTFILE="$XDG_DATA_HOME/zsh/histfile"
HISTSIZE=1000
SAVEHIST=1000

# Aliases
alias c="clear"
alias q="cd && c"
alias e="exit"
alias vim="nvim"
alias svim="vim \$(git ls-files -mo --exclude-standard)"
alias tp="open_tmux_project"
alias ompts="switch_omp_theme"

# Oh My Zsh!
export ZSH="$XDG_DATA_HOME/oh-my-zsh" 
export ZSH_CUSTOM="$XDG_DATA_HOME/zsh"

# Vi Mode
function zvm_config() {
	ZVM_CURSOR_STYLE_ENABLED=false
}

plugins=(
	git
	stowsh
	tmux-project-opener
	omp-theme-switcher
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zoxide
eval "$(zoxide init zsh)"

# Oh My Posh

theme_file="$XDG_CONFIG_HOME/oh-my-posh/current-theme"

if [[ -r "$theme_file" ]]; then
  selected_theme="$(<"$theme_file")"
else
  selected_theme="$XDG_CONFIG_HOME/oh-my-posh/themes/quick-term.omp.json"
fi

eval "$(oh-my-posh init zsh --config "$selected_theme")"
