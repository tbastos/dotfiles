# PATH
$env.PATH = ($env.PATH | prepend ($env.HOME | path join ".local" "bin"))

# Homebrew (macOS Apple Silicon)
if ("/opt/homebrew/bin" | path exists) {
    $env.HOMEBREW_PREFIX = "/opt/homebrew"
    $env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
    $env.HOMEBREW_REPOSITORY = "/opt/homebrew"
    $env.PATH = ($env.PATH
        | prepend "/opt/homebrew/sbin"
        | prepend "/opt/homebrew/bin")
    $env.CLICOLOR = "1"
}

# Starship prompt
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config" "starship" "starship.toml")
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# EDITOR
$env.EDITOR = (if (which nvim | is-not-empty) {
    "nvim"
} else if (which vim | is-not-empty) {
    "vim"
} else {
    "vi"
})

# Zoxide
if (which zoxide | is-not-empty) {
    zoxide init nushell | save -f ~/.cache/zoxide.nu
} else {
    "" | save -f ~/.cache/zoxide.nu
}
