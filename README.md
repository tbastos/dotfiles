### Dependencies

On OSX:
```zsh
brew install \
  boost-python \
  clang-format \
  cmake \
  cscope \
  ctags \
  figlet \
  fzf \
  git \
  hub \
  lua \
  python3 \
  scmpuff \
  the_silver_searcher \
  tig \
  wget \
  zplug

# Arcanist
brew install homebrew/php/arcanist --HEAD

# NeoVim
brew install neovim/neovim/neovim --HEAD
pip3 install neovim
```

### Install

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles

# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# Git
mkdir ~/.config && mkdir ~/.config/git
ln -s ~/.dotfiles/git/config ~/.config/git/config

# NeoVim
ln -s ~/.dotfiles/vim ~/.config/nvim
ln -s ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim

# Karabiner (OSX)
ln -s ~/.dotfiles/mac ~/.config/karabiner
```

### Updates

```zsh
brew update
brew upgrade
zplug update
```
