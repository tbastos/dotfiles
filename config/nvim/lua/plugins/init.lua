return {
  -- Color Schemes
  { import = "plugins.colors" },

  -- Libraries & Optimizations
  { "nvim-tree/nvim-web-devicons", name = "icons" },
  { "nvim-lua/plenary.nvim", name = "plenary", priority = 100 },

  -- File Explorer
  { "kyazdani42/nvim-tree.lua", dependencies = "icons", opts = {} },

  -- Fuzzy Finders
  { import = "plugins.find" },

  -- Buffer Management
  { import = "plugins.buffer" },

  -- Terminal Integration
  { import = "plugins.terminal" },

  -- Git integration
  { "lewis6991/gitsigns.nvim", opts = {} },

  -- Greeter (start screen / dashboard)
  { import = "plugins.greeter" },

  -- Statusline
  { import = "plugins.statusline" },

  -- TreeSitter syntax highlighting/plugins (:TSInstall to add languages)
  { import = "plugins.highlight" },

  -- LSP
  { import = "plugins.lsp" },

  -- Formatting & Linting
  { import = "plugins.format" },

  -- Editing
  { "tpope/vim-repeat" },
  { "kylechui/nvim-surround", opts = {} },
  { "tpope/vim-unimpaired" },
  { "junegunn/vim-easy-align" },
  { "andymass/vim-matchup" },
  { "windwp/nvim-autopairs", opts = {} },

  -- Indentation
  { import = "plugins.indent" },

  -- Text Objects (see also: treesitter textobjects!)
  { "kana/vim-textobj-user", lazy = false, priority = 100 }, -- library
  { "kana/vim-textobj-line" }, -- al, il (line)
  { "kana/vim-textobj-entire" }, -- ae, ie (entire buffer)
  { "Julian/vim-textobj-variable-segment" }, -- av, iv (a_segment_of anyVarName)
  { "beloglazov/vim-textobj-quotes" }, -- aq, iq (nearest quotes of any kind)
  { "glts/vim-textobj-comment" }, -- ac, ic (comment)

  -- Completion & Snippets
  { import = "plugins.cmp" },
}
