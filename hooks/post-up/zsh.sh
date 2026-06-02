#!/bin/sh

# ZDOTDIR (~/.config/zsh) needs dotted filenames, but rcup only links the
# undotted ones — so create the dotted aliases here. -f makes this idempotent
# (re-runs replace the existing links instead of erroring), and the trailing
# `exit 0` stops rcup from reporting the hook as failed.
ln -sfn zshrc                ~/.config/zsh/.zshrc
ln -sfn zprofile             ~/.config/zsh/.zprofile
ln -sfn ~/.config/zsh/zshenv ~/.zshenv

exit 0
