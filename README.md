Dependencies
------------

On OSX:
```zsh
brew install ack cmake cscope ctags hub lua luarocks tmux
brew install macvim --custom-icons --override-system-vim --with-lua --with-cscope --HEAD
```

Installation
------------

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles
```

Updating
--------

```zsh
git pull && git submodule update --init --recursive
```

Symlinks
--------

```zsh
# Zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# Git
ln -s ~/.dotfiles/git/config ~/.gitconfig

# Vim
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc
```

