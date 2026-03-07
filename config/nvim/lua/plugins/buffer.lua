return {
  {'famiu/bufdelete.nvim'},

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'icons',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
      },
    },
  },

}
