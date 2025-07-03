# Dotfiles

My dotfiles.

## Prerequisites

Ensure you have the following installed on your system:

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Installation

### 1. Clone the Repository

Clone the dotfiles repository to your system.

```bash
git clone git@github.com:throskam/dotfiles.git ~/.dotfiles
```

### 2. Configure the shell

Choose your preferred shell.

#### Zsh

1. Use `stowsh` to configure `zsh`.

```bash
.dotfiles/stowsh .dotfiles/zsh
```

2. Install `zsh` using your package manager.
1. Install the dependencies.

- [Oh My Posh](https://ohmyposh.dev/docs/installation/linux)
- [Oh My Zsh!](https://ohmyz.sh/#install)
- [Zoxide](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)
- [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [Zsh Vi Mode](https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#as-an-oh-my-zsh-custom-plugin)

4. Make `zsh` the default shell.

```bash
chsh -s $(which zsh)
```

#### Fish

1. Use `stowsh` to configure `fish`.

```bash
.dotfiles/stowsh .dotfiles/fish
```

2. Install `fish` using your package manager.
1. Install the dependencies.

- [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish?tab=readme-ov-file#installation)

4. Make `fish` the default shell.

```bash
chsh -s $(which fish)
```

### 3. Configure with `stowsh`

Add any configurations necessary.

```bash
stowsh <module-name>
```

Replace `<module-name>` with the appropriate module you wish to configure.

> [!NOTE]
> Run this step before installing any packages to avoid creating default configurations that might create conflicts.

### 4. Install Packages

Install the following package with your package manager.

- `bat`
- `build-essential`
- `fd-find`
- `fzf`
- `gron`
- `httpie`
- `jq`
- `ripgrep`
- `silversearcher-ag` (called `the_silver_searcher` on macos)
- `tmux`
- `wl-clipboard` (Wayland Linux)

Manually install the following packages and applications.

- [NVM](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)
- [Go](https://go.dev/doc/install)
- [Rust](https://www.rust-lang.org/tools/install)
- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [Vim](https://www.vim.org/download.php)
- [Alacritty](https://alacritty.org/#Installation)
