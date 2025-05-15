return {
  {'famiu/bufdelete.nvim'},

  {
    'akinsho/bufferline.nvim',
    dependencies = 'icons',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
      },
    },
  },

}
