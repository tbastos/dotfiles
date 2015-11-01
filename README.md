### Dependencies

On OSX:
```zsh
brew install boost-python cmake cscope ctags git lua the_silver_searcher 
brew install macvim --custom-icons --override-system-vim --with-lua --with-cscope --HEAD
```

### Installation

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles
```

### Updating

```zsh
git pull && git submodule update --init --recursive
```

### Symlinks

```zsh
# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# Git
ln -s ~/.dotfiles/git/config ~/.gitconfig

# Vim
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/gvimrc ~/.gvimrc

# Ruby
ln -s ~/.dotfiles/gemrc ~/.gemrc

# Karabiner (OSX)
ln -s ~/.dotfiles/osx/karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml
```

