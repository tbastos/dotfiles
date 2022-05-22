# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

########################################################################
# Powerlevel10 Theme ( https://github.com/romkatv/powerlevel10k )
########################################################################

source ~/.dotfiles/vendor/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

########################################################################
# Key Bindings
########################################################################

# custom bindings for things not available in vim's insert mode
bindkey '^Z' undo
bindkey '^Y' redo
bindkey '^[[H' beginning-of-line       # Home
bindkey '^[[F' end-of-line             # End
bindkey '^[[3~' delete-char            # Del
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down

########################################################################
# Aliases
########################################################################

alias gsu='git submodule update --recursive'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Filesystem Navigation

cdpath=(
  $HOME/Documents
  $HOME/src
  $HOME
)

# listing
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias ldot='ls -ld .*'

# ascending
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# automatically list directory contents on 'cd'
auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )
