### Dependencies

Install preferred [Nerd Font](https://www.nerdfonts.com/font-downloads) (JetBrainsMono Nerd Font).

```zsh
# On macOS:
brew install fd fzf git python rcm ripgrep lazygit neovim tmux

# On Debian Linux:
sudo apt install fd-find fzf git rcm ripgrep tmux
```

Or fetch the latest binary releases: [lazygit](https://github.com/jesseduffield/lazygit/releases) | [neovim](https://github.com/neovim/neovim/releases)

### Install

Clone this repo (and submodules) to `~/.dotfiles` and use [rcm](https://github.com/thoughtbot/rcm) to link all dotfiles and dirs:

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles
lsrc # dry run
rcup -v
```

### Update

```zsh
cd ~/.dotfiles && git pull
git submodule update --init --recursive
```
