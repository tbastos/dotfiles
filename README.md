### Dependencies

On OSX:
```zsh
# Tools
brew install boost-python cmake cscope ctags fzf git hub lua scmpuff the_silver_searcher

# MacVim
brew install macvim --with-custom-icons --with-lua --with-cscope

# NeoVim
brew install neovim/neovim/neovim --HEAD
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
ln -s ~/.dotfiles/vim ~/.config/nvim
ln -s ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim

# Karabiner (OSX)
ln -s ~/.dotfiles/osx/karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml
```

### Update

```zsh
git pull && git submodule update --init --recursive
```

