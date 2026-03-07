return {

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.install').install(
        { 'c', 'cpp', 'go', 'lua', 'python' }
      )
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = { lookahead = true },
        move   = { set_jumps = true },
      })

      local sel  = require('nvim-treesitter-textobjects.select')
      local swap = require('nvim-treesitter-textobjects.swap')
      local move = require('nvim-treesitter-textobjects.move')

      -- Select text objects (visual + operator-pending modes)
      local sel_map = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["a,"] = "@parameter.outer",
        ["i,"] = "@parameter.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["a;"] = "@statement.outer",
      }
      for key, query in pairs(sel_map) do
        vim.keymap.set({'x', 'o'}, key, function()
          sel.select_textobject(query, 'textobjects')
        end, { silent = true })
      end

      -- Swap parameters
      vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner',     'textobjects') end, { silent = true })
      vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner', 'textobjects') end, { silent = true })

      -- Move between functions and classes
      local o = { silent = true }
      vim.keymap.set('n', ']m',  function() move.goto_next_start('@function.outer',     'textobjects') end, o)
      vim.keymap.set('n', ']]',  function() move.goto_next_start('@class.outer',         'textobjects') end, o)
      vim.keymap.set('n', ']M',  function() move.goto_next_end('@function.outer',        'textobjects') end, o)
      vim.keymap.set('n', '][',  function() move.goto_next_end('@class.outer',           'textobjects') end, o)
      vim.keymap.set('n', '[m',  function() move.goto_previous_start('@function.outer',  'textobjects') end, o)
      vim.keymap.set('n', '[[',  function() move.goto_previous_start('@class.outer',     'textobjects') end, o)
      vim.keymap.set('n', '[M',  function() move.goto_previous_end('@function.outer',    'textobjects') end, o)
      vim.keymap.set('n', '[]',  function() move.goto_previous_end('@class.outer',       'textobjects') end, o)
    end,
  },

  { 'HiPhish/rainbow-delimiters.nvim' },

}
