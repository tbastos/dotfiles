-- Indentation Guides
require("indent_blankline").setup {
  filetype_exclude = {
     "help",
     "terminal",
     "alpha",
     "packer",
     "lspinfo",
     "TelescopePrompt",
     "TelescopeResults",
     "nvchad_cheatsheet",
     "lsp-installer",
     "",
  },
  buftype_exclude = { "terminal" },
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
}