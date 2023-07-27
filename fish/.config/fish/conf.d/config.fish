# Local binaries.
set -x PATH $HOME/.local/bin $PATH

# Use vim as default editor.
set -x VISUAL "nvim"
set -x EDITOR "$VISUAL"

# Go workspaces.
set -x PATH $PATH /usr/local/go/bin
set -x GOPATH $HOME/.local/go
set -x GOBIN $HOME/.local/bin
