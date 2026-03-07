local api = vim.api

local hide_statusline_ft = {
  alpha    = true,
  help     = true,
  NvimTree = true,
  terminal = true,
}

-- Hide statusline on certain filetypes
api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'FileType', 'WinEnter' }, {
  callback = function()
    local ft = vim.bo.filetype
    vim.o.laststatus = hide_statusline_ft[ft] and 0 or 2
  end,
})

-- Restore last cursor position when reopening a file (skip git commits)
api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    if vim.bo.filetype:match('^git') then return end
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Edit crontab in-place (required on macOS)
api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
  pattern = { 'crontab', '/private/tmp/crontab.*' },
  callback = function() vim.opt_local.backupcopy = 'yes' end,
})
