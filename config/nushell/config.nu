$env.config.show_banner = false
$env.config.edit_mode = "vi"

$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 1_000
$env.config.history.sync_on_enter = true
$env.config.history.isolation = false

$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.algorithm = "prefix"

# Aliases

def --wrapped e [...args] { ^$env.EDITOR ...$args }

alias gs = git status
alias gsu = git submodule update --recursive
alias t = tail -f

alias l = ls -l
alias la = ls -a
alias ll = ls -la

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..

# Auto-ls on directory change
$env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD? | default [])
$env.config.hooks.env_change.PWD ++= [{|before, after| ls }]

# Keybindings
$env.config.keybindings ++= [
    {
        name: undo
        modifier: control
        keycode: char_z
        mode: [emacs, vi_insert]
        event: { edit: undo }
    }
    {
        name: redo
        modifier: control
        keycode: char_y
        mode: [emacs, vi_insert]
        event: { edit: redo }
    }
]
