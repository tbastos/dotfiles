### Dependencies

On OSX:
```zsh
brew install boost-python clang-format cmake cscope ctags figlet fzf git hub lua scmpuff the_silver_searcher tig wget zplug

# NeoVim
brew install neovim/neovim/neovim --HEAD
sudo easy_install neovim
# Fix for <C-h> mapping in NeoVim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

### Install

```zsh
git clone --recursive https://github.com/tbastos/dotfiles.git ~/.dotfiles

# Zsh
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.dotfiles/zsh/.zshrc

# Git
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
