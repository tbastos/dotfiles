return {

  { 'williamboman/mason.nvim', opts = {} },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = { 'lua_ls', 'pyright', 'gopls' },
      automatic_installation = true,
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Apply capabilities to all servers
      vim.lsp.config('*', { capabilities = capabilities })

      -- lua_ls: configure for Neovim Lua development
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({ 'lua_ls', 'pyright', 'gopls' })
    end,
  },

}
