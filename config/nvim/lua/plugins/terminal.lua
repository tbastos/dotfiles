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
  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
      local opts = { buffer = 0, noremap = true }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk',   [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end,
  })

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
