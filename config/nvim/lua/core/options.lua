local vim = vim
local fn, g, opt = vim.fn, vim.g, vim.opt

opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt='menu,menuone,noselect'
opt.cul = true -- cursor line
opt.encoding = 'utf-8'
opt.hidden = true
opt.ignorecase = true
opt.laststatus = 3 -- global statusline
opt.mouse = 'a'
opt.relativenumber = false
opt.sessionoptions='blank,buffers,curdir,folds,globals,help,tabpages,winsize,winpos,terminal'
opt.shortmess:append 'sI' -- disable nvim intro
opt.showbreak = '↪ '
opt.signcolumn = 'yes'
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeoutlen = 400
opt.title = true
opt.undofile = true
opt.whichwrap:append '<>[]hl' -- go to prev/next line by moving the cursor left/right

-- indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- line numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.ruler = false

-- interval (ms) for writing swap file to disk and sending update events (used by gitsigns)
opt.updatetime = 250

-- leader keys
g.mapleader = ','
g.maplocalleader = '\\'

local disabled_builtin_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for i, name in ipairs(disabled_builtin_plugins) do
  g['loaded_'..name] = 1
end