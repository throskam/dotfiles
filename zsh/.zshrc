# Enable history
HISTFILE="$XDG_DATA_HOME/zsh/histfile"
HISTSIZE=1000
SAVEHIST=1000

# Aliases
alias c="clear"
alias q="cd && c"
alias e="exit"
alias vim="nvim"
alias svim="vim (git ls-files -mo --exclude-standard)"

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
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/quick-term.omp.json)"
# eval "$(oh-my-posh init zsh --config $HOME/.oh-my-posh/marcduiker.omp.json)"
