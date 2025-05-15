local M = {}

local vim = vim
local api = vim.api

local hide_statusline_ft = {
  alpha = true,
  help = true,
  NvimTree = true,
  terminal = true,
}

-- on buffer enter / file type change
vim.cmd[[autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require("config.autocmds").on_buf_ft()]]
function M.on_buf_ft()
  -- hide status line on certain windows
  local ft = api.nvim_buf_get_option(0, "ft")
  local hide = 
  api.nvim_set_option("laststatus", hide_statusline_ft[ft] and 0 or 2)
end

-- remember last location in files (except for git commit messages)
vim.cmd[[
augroup RestoreCursor
  au!
  au BufReadPost *
        \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
]]

-- edit crontab files inplace
vim.cmd[[
augroup EditingCrontab
  au!
  au FileType crontab setlocal backupcopy=yes
  " Caveat: on OS X the file has no ft, so we must use a pattern
  au BufEnter /private/tmp/crontab.* setlocal backupcopy=yes
augroup END
]]

-- language-specific settings
vim.cmd[[
augroup EditingFileType
  au!
  au FileType python setlocal tabstop=2
augroup END
]]

return M
