### Dependencies

On OSX:
```zsh
brew install boost-python cmake cscope ctags git hub lua scmpuff the_silver_searcher
brew install macvim --with-custom-icons --with-override-system-vim --with-lua --with-cscope --HEAD
```

### Install

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles

# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# Git
ln -s ~/.dotfiles/git/config ~/.config/git/config

# Vim
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc

# NeoVim
ln -s ~/.dotfiles/nvim ~/.config/nvim

# Karabiner (OSX)
ln -s ~/.dotfiles/osx/karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml
```

### Update

```zsh
git pull && git submodule update --init --recursive
```

