### Dependencies

Install preferred [Nerd Font](https://www.nerdfonts.com/font-downloads) (JetBrainsMono Nerd Font).

```sh
# On macOS:
brew install delta eza fd fzf git nushell python rcm ripgrep rust lazygit neovim starship tmux zoxide

# On Debian Linux:
sudo apt install eza fd-find fzf git git-delta lazygit nushell rcm ripgrep rust starship tmux zoxide

# Then:
cargo install --locked zsh-patina
```


### Install

Clone this repo (and submodules) to `~/.dotfiles` and use [rcm](https://github.com/thoughtbot/rcm) to link all dotfiles and dirs:

```sh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles
lsrc # dry run
rcup -v
```

### Update

```sh
cd ~/.dotfiles && git pull
git submodule update --init --recursive
```
