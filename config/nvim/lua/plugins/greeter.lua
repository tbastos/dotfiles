local function setup()
  local greeter = require'alpha.themes.dashboard'

  local v = vim.version()
  greeter.section.header.val = {
    "                                                  ",
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "                                                  ",
    '          '..v.major..'.'..v.minor..'.'..v.patch..'   '..os.date('%Y-%m-%d %H:%M:%S'),
  }

  local function button(...)
    local t = greeter.button(...)
    t.opts.hl = 'Function'
    return t
  end 

  greeter.section.buttons.val = {
    button('e', '  New file', '<CMD>ene <BAR> startinsert<CR>'),
    button('SPC f', '  Find file'),
    button('SPC r', '  Recently opened files'),
    button('SPC s', '  Find word'),
    button('SPC m', '  Jump to bookmarks'),
    button('d', '漣 Edit dotfiles', '<CMD>cd ~/.dotfiles/<CR><CMD>e $MYVIMRC<CR>'),
    button('q', '  Quit', '<CMD>qa<CR>'),
  }

  greeter.section.footer.val = require'alpha.fortune'()

  require'alpha'.setup(greeter.config)
end

return {
  "goolord/alpha-nvim",
  dependencies = 'icons',
  config = setup,
}
