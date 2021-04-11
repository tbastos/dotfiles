### Install

```zsh
# On macOS:
brew install \
  figlet \
  fzf \
  git \
  hub \
  python3 \
  scmpuff \
  the_silver_searcher \
  tig \
  tmux

git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles

# Git
mkdir ~/.config && mkdir ~/.config/git
ln -s ~/.dotfiles/git/config ~/.config/git/config

# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# NeoVim
brew install neovim/neovim/neovim --HEAD
pip install neovim
ln -s ~/.dotfiles/vim ~/.config/nvim
ln -s ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim
```

### Update

```zsh
cd ~/.dotfiles && git pull
git submodule update --init --recursive
zplug update

# On macOS:
brew update
brew upgrade
```
