local vim = vim
local api = vim.api

local colors = require'colors'

local icons = {
  left = "",
  right = "",
  mode = " ",
  position = " ",
}

local severity = vim.diagnostic.severity

local C = {
  lsp = require 'feline.providers.lsp',
}

C.file_name = {
  provider = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = " "
      return icon
    end
    return " " .. icon .. " " .. filename .. " "
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = colors.statusline_bg,
    bg = colors.nord_blue,
  },
  right_sep = {
    str = icons.right,
    hl = {
      fg = colors.nord_blue,
      bg = colors.lightbg,
    },
  },
}

C.dir_name = {
  provider = function()
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return "  " .. dir_name .. " "
  end,
  enabled = function(winid)
     return api.nvim_win_get_width(tonumber(winid) or 0) > 80
  end,
  hl = {
    fg = colors.grey_fg2,
    bg = colors.lightbg2,
  },
  right_sep = {
    str = icons.right,
    hi = {
      fg = colors.lightbg2,
      bg = colors.statusline_bg,
    },
  },
}

C.diff = {
  add = {
    provider = "git_diff_added",
    hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
    },
    icon = " ",
  },
  change = {
    provider = "git_diff_changed",
    hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
    },
    icon = "  ",
  },
  remove = {
    provider = "git_diff_removed",
    hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
    },
    icon = "  ",
  },
}

C.git_branch = {
  provider = "git_branch",
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = colors.grey_fg2,
    bg = colors.statusline_bg,
  },
  icon = "  ",
}

C.diagnostic = {
  error = {
    provider = "diagnostic_errors",
    enabled = function()
      return C.lsp.diagnostics_exist(severity.ERROR)
    end,
    hl = { fg = colors.red },
    icon = "  ",
  },
  warning = {
    provider = "diagnostic_warnings",
    enabled = function()
      return C.lsp.diagnostics_exist(severity.WARN)
    end,
    hl = { fg = colors.yellow },
    icon = "  ",
  },
  hint = {
    provider = "diagnostic_hints",
    enabled = function()
      return C.lsp.diagnostics_exist(severity.HINT)
    end,
    hl = { fg = colors.grey_fg2 },
    icon = "  ",
  },
  info = {
    provider = "diagnostic_info",
    enabled = function()
      return C.lsp.diagnostics_exist(severity.INFO)
    end,
    hl = { fg = colors.green },
    icon = "  ",
  },
}

C.lsp_progress = {
  provider = function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]
    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {"","",""}
      local success_icon = {"","",""}
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners
      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
      end
      return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
    end
    return ""
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 80
  end,
  hl = { fg = colors.green },
}

C.lsp_icon = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      return "  LSP"
    else
      return ""
    end
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

C.mode_colors = {
  ["n"] = { "NORMAL", colors.red },
  ["no"] = { "N-PENDING", colors.red },
  ["i"] = { "INSERT", colors.dark_purple },
  ["ic"] = { "INSERT", colors.dark_purple },
  ["t"] = { "TERMINAL", colors.green },
  ["v"] = { "VISUAL", colors.cyan },
  ["V"] = { "V-LINE", colors.cyan },
  [""] = { "V-BLOCK", colors.cyan },
  ["R"] = { "REPLACE", colors.orange },
  ["Rv"] = { "V-REPLACE", colors.orange },
  ["s"] = { "SELECT", colors.nord_blue },
  ["S"] = { "S-LINE", colors.nord_blue },
  [""] = { "S-BLOCK", colors.nord_blue },
  ["c"] = { "COMMAND", colors.pink },
  ["cv"] = { "COMMAND", colors.pink },
  ["ce"] = { "COMMAND", colors.pink },
  ["r"] = { "PROMPT", colors.teal },
  ["rm"] = { "MORE", colors.teal },
  ["r?"] = { "CONFIRM", colors.teal },
  ["!"] = { "SHELL", colors.green },
}

C.mode_hl = function()
  return {
    fg = C.mode_colors[vim.fn.mode()][2],
    bg = colors.one_bg,
  }
end

C.empty_space = {
  provider = " " .. icons.left,
  hl = {
    fg = colors.one_bg2,
    bg = colors.statusline_bg,
  },
}

-- this matches the vi mode color
C.empty_space_colored = {
  provider = icons.left,
  hl = function()
    return {
      fg = C.mode_colors[vim.fn.mode()][2],
      bg = colors.one_bg2,
    }
  end,
}

C.mode_icon = {
  provider = icons.mode,
  hl = function()
    return {
      fg = colors.statusline_bg,
      bg = C.mode_colors[vim.fn.mode()][2],
    }
  end,
}

C.empty_space2 = {
  provider = function()
    return " " .. C.mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = C.mode_hl,
}

C.separator_right = {
  provider = icons.left,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = colors.grey,
    bg = colors.one_bg,
  },
}

C.separator_right2 = {
  provider = icons.left,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = colors.green,
    bg = colors.grey,
  },
}

C.position_icon = {
  provider = icons.position,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = colors.black,
    bg = colors.green,
  },
}

C.current_line = {
  provider = function()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"
    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line "$" then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,
  enabled = function(winid)
    return api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = colors.green,
    bg = colors.one_bg,
  },
}

local left = {
  C.file_name,
  C.dir_name,
  C.diff.add,
  C.diff.change,
  C.diff.remove,
  C.diagnostic.error,
  C.diagnostic.warning,
  C.diagnostic.hint,
  C.diagnostic.info,
}

local middle = {
  C.lsp_progress,
}

local right = {
  C.lsp_icon,
  C.git_branch,
  C.empty_space,
  C.empty_space_colored,
  C.mode_icon,
  C.empty_space2,
  C.separator_right,
  C.separator_right2,
  C.position_icon,
  C.current_line,
}

require('feline').setup{
  theme = {
    bg = colors.statusline_bg,
    fg = colors.fg,
  },
  components = {
    active = {left, middle, right},
  },
}