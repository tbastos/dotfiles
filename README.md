### Install

```zsh
# On macOS:
brew install \
  ansible \
  homebrew/php/arcanist --HEAD \
  boost-python \
  clang-format \
  cmake \
  figlet \
  fzf \
  git \
  graphviz \
  hub \
  lua \
  node \
  protobuf \
  python3 \
  scmpuff \
  the_silver_searcher \
  tig \
  tmux \
  wget \
  yarn

git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles

# Git
mkdir ~/.config && mkdir ~/.config/git
ln -s ~/.dotfiles/git/config ~/.config/git/config

# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# NeoVim
brew install neovim/neovim/neovim --HEAD
pip3 install neovim
ln -s ~/.dotfiles/vim ~/.config/nvim
ln -s ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim

# Sphinx
pip3 install sphinx hieroglyph sphinx_rtd_theme

# Karabiner-Elements
ln -s ~/.dotfiles/mac ~/.config/karabiner
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
