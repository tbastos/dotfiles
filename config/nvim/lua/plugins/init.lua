local fn = vim.fn        

-- auto-install plugin manager 'packer.nvim'
local data_path = fn.stdpath('data')
local bootstrapping, install_path = false, data_path..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  bootstrapping = fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim '..install_path)
  vim.opt.runtimepath:append(data_path..'/site/pack/*/start/*')
end

return require('packer').startup(function(use)
  -- Libraries & Optimizations
  use {'kyazdani42/nvim-web-devicons', as='icons'}
  use {'nvim-lua/plenary.nvim', as='plenary'}
  use {'lewis6991/impatient.nvim'}
  use {'nathom/filetype.nvim'}

  -- File Explorer
  use {'kyazdani42/nvim-tree.lua', requires='icons', config=[[require'plugins.config.tree']]}

  -- Fuzzy Finder
  use {'nvim-telescope/telescope.nvim', requires='plenary', config=[[require'plugins.config.telescope']]}
  use {'nvim-telescope/telescope-fzf-native.nvim', run='make', config=[[require'telescope'.load_extension'fzf']]}

  -- Buffer Management
  use {'famiu/bufdelete.nvim'}
  use {'akinsho/bufferline.nvim', requires='icons', config=[[require'plugins.config.bufferline']]}

  -- Terminal Integration
  use {"akinsho/toggleterm.nvim", config=[[require'plugins.config.toggleterm']]}
  use {"ojroques/vim-oscyank"}

  -- Git integration
  use {'lewis6991/gitsigns.nvim', config=[[require'plugins.config.git']]}

  -- Color Schemes
  use {'navarasu/onedark.nvim', config=[[require'colors']]}

  -- Greeter (start screen / dashboard)
  use {'goolord/alpha-nvim', requires='icons', config=[[require'plugins.config.greeter']]}

  -- Statusline
  use {'famiu/feline.nvim', requires='icons', config=[[require'plugins.config.statusline']]}

  -- TreeSitter syntax highlighting/plugins (:TSInstall to add languages)
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate', config=[[require'plugins.config.treesitter']]}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {'p00f/nvim-ts-rainbow'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'jose-elias-alvarez/null-ls.nvim', requires='plenary', config=[[require'plugins.config.lsp']]}

  -- Editing 
  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'junegunn/vim-easy-align'}
  use {'andymass/vim-matchup'}
  use {'windwp/nvim-autopairs', config=[[require'nvim-autopairs'.setup()]]}
  use {'numToStr/Comment.nvim', config=[[require'Comment'.setup()]]}
  use {'lukas-reineke/indent-blankline.nvim', config=[[require'plugins.config.indent']]}

  -- Text Objects (see also: treesitter textobjects!)
  use {'kana/vim-textobj-user'} -- library
  use {'kana/vim-textobj-line'} -- al, il (line)
  use {'kana/vim-textobj-entire'} -- ae, ie (entire buffer)
  use {'Julian/vim-textobj-variable-segment'} -- av, iv (a_segment_of anyVarName)
  use {'beloglazov/vim-textobj-quotes'} -- aq, iq (nearest quotes of any kind)
  use {'glts/vim-textobj-comment'} -- ac, ic (comment)

 -- Completion & Snippets 
  use {'hrsh7th/nvim-cmp', config=[[require'plugins.config.cmp']], requires={
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  }}

  -- Have packer manage itself 
  use 'wbthomason/packer.nvim'
  if bootstrapping then -- keep this at the end
      require('packer').sync()
  end
end)
