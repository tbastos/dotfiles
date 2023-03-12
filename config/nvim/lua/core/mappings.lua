local vim = vim
local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- convenience mappings
map('n', 'U', ':redo<cr>') -- redo with U (better than c-r)
map('n', '<leader>w', ':w <cr>') -- write current buffer
map('n', '<leader>c', ':Bdelete <cr>') -- close a buffer without closing the window
map('', '<leader>q', ':q <cr>') -- quit current window
map('', 'Q', '<nop>') -- don't map to Ex mode
map('', '<c-w><c-q>', '<nop>') -- don't map to window quit
map('', 'QQ', ':qa <cr>') -- quit all windows
map('', 'Q!', ':qa! <cr>') -- quit all windows (discarding changes)
map('n', '<leader>C', ':cd %:p:h<cr>:pwd<cr>') -- cd to current file's dir
map('n', '<esc>', ':noh <cr>') -- <esc> turns off search highlighting

-- jump to start/end of line (easier to type)
map('', 'H', '^')
map('', 'L', '$')
map('v', 'L', 'g_')

-- copy text to the system clipboard from anywhere (using the ANSI OSC52 sequence)
map('v', '<leader>y', ':OSCYank<cr>')
map('n', '<leader>y', '<Plug>OSCYank')

-- select contents of current line, excluding indentation
map('n', 'vv', '^vg_')

-- reselect visual block after indent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- quick splits
map('n', '\\\\', ':split <cr>')
map('n', '<bar>', ':vsplit <cr>')

-- move cursor between windows (directionally)
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- move the current window (change the layout)
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')

-- file explorer
map('n', '<leader>e', ':NvimTreeToggle <cr>')
map('n', '<localleader>e', ':NvimTreeFocus <cr>')

-- telescope
map('n', '<space>b',  ':Telescope buffers <cr>')
map('n', '<space>f',  ':Telescope find_files <cr>')
map('n', '<space>F',  ':Telescope find_files follow=true no_ignore=true hidden=true <cr>')
map('n', '<space>r',  ':Telescope oldfiles <cr>')
map('n', '<space>s',  ':Telescope live_grep <cr>')
map('n', '<space>a',  ':Telescope live_grep <cr>')
map('n', '<space>m',  ':Telescope marks <cr>')
map('n', '<space>gc', ':Telescope git_commits <cr>')
map('n', '<space>gs', ':Telescope git_status <cr>')
map('n', '<space>h',  ':Telescope help_tags <cr>')

-- toggle terminals
map('n', '<localleader>g', "<cmd>lua toggleterm_lazygit()<cr>")
map('n', '<localleader>t', "<cmd>lua toggleterm_htop()<cr>")

-- lsp
map('n', 'gD', ':lua vim.lsp.buf.declaration() <cr>')
map('n', 'gd', ':lua vim.lsp.buf.definition() <cr>')
map('n', 'gt', ':lua vim.lsp.buf.type_definition() <cr>')
map('n', 'K', ':lua vim.lsp.buf.hover() <cr>')
map('n', 'gi', ':lua vim.lsp.buf.implementation() <cr>')
map('n', 'gk', ':lua vim.lsp.buf.signature_help() <cr>')
map('n', 'gr', ':lua vim.lsp.buf.references() <cr>')
map('n', '<localleader>wa', ':lua vim.lsp.buf.add_workspace_folder() <cr>')
map('n', '<localleader>wr', ':lua vim.lsp.buf.remove_workspace_folder() <cr>')
map('n', '<localleader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())) <cr>')
map('n', '<localleader>r', ':lua vim.lsp.buf.rename() <cr>')
map('n', '<localleader>c', ':lua vim.lsp.buf.code_action() <cr>')
map('n', '<localleader>d', ':lua vim.diagnostic.open_float() <cr>')
map('n', '[d', ':lua vim.diagnostic.goto_prev() <cr>')
map('n', ']d', ':lua vim.diagnostic.goto_next() <cr>')
map('n', '<localleader>l', ':lua vim.diagnostic.setloclist() <cr>')
map('n', '<localleader>f', ':lua vim.lsp.buf.formatting() <cr>')

-- easy align code
map('n', 'ga', '<Plug>(EasyAlign)') -- for motion/object (e.g. gaip)
map('v', 'ga', '<Plug>(EasyAlign)') -- for visual mode (e.g. vipga)
