require'nvim-treesitter.configs'.setup {
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
}