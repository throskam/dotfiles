export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export PATH=$PATH:$HOME/.local/bin

export VISUAL=nvim
export EDITOR=nvim
export LC_ALL=en_US.UTF-8

# Go
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin

# Rust
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PATH=$PATH:$CARGO_HOME/bin
