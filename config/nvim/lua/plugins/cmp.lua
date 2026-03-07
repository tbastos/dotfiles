local function cmp_setup()
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body) -- native Neovim 0.10+ snippet engine
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"]     = cmp.mapping.select_prev_item(),
      ["<C-n>"]     = cmp.mapping.select_next_item(),
      ["<C-d>"]     = cmp.mapping.scroll_docs(-4),
      ["<C-f>"]     = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"]     = cmp.mapping.close(),
      ["<CR>"]      = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    }),
  })

  -- Use buffer source for `/`
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
  })

  -- Use cmdline & path source for `:`
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      { { name = 'path' } },
      { { name = 'cmdline' } }
    )
  })

  -- Integrate with nvim-autopairs
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = cmp_setup,
  },
}
