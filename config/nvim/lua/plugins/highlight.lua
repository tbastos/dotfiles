return {

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      -- A list of parser names, or "all"
      ensure_installed = {'c', 'cpp', 'go', 'lua'},
      sync_install = false, -- install parsers synchronously?

      -- List of parsers to ignore installing (for "all")
      ignore_install = {}, -- list of languages

      highlight = {
        enable = true, -- false disables the whole extension
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
      },
      indent = {
        enable = true,
        disable = {},
      },
      matchup = {
        enable = true,
        disable = {},
      },
      rainbow = {
        enable = true,
        disable = {},
        extended_mode = true, -- also highlight non-bracket delimiters like html tags (bool or table: lang -> bool)
        max_file_lines = nil, -- disable for files with more than n lines (int)
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["a,"] = "@parameter.outer",
            ["i,"] = "@parameter.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["a;"] = "@statement.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
  },

  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'p00f/nvim-ts-rainbow'},

}
