local function toggleterm_setup()
  require("toggleterm").setup{
    open_mapping = [[<C-\>]],
    shade_filetypes = { 'none' },
    start_in_insert = true,
    insert_mappings = false,
    direction = 'horizontal',
    float_opts = { border = 'rounded', winblend = 3 },
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
  }
  -- Terminal Mappings

  function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  -- Custom Terminals

  local Terminal  = require('toggleterm.terminal').Terminal

  local float_handler = function(term)
    if vim.fn.mapcheck('jk', 't') ~= '' then
      vim.api.nvim_buf_del_keymap(term.bufnr, 't', 'jk')
      vim.api.nvim_buf_del_keymap(term.bufnr, 't', '<esc>')
    end
  end

  local lazygit = Terminal:new{
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    on_open = float_handler,
  }
  function _G.toggleterm_lazygit()
    lazygit:toggle()
  end

  local htop = Terminal:new{
    cmd = 'htop',
    hidden = true,
    direction = 'float',
    on_open = float_handler,
  }
  function _G.toggleterm_htop()
    htop:toggle()
  end

end

return {

  {"ojroques/vim-oscyank"},

  {
    "akinsho/toggleterm.nvim",
    config = toggleterm_setup,
  },

}
