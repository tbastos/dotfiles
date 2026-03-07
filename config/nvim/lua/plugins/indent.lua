return {

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      exclude = {
        filetypes = {
          "help", "alpha", "lazy", "mason",
          "TelescopePrompt", "TelescopeResults", "",
        },
        buftypes = { "terminal" },
      },
    },
  },

}