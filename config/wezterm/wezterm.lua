local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = "OneDark (base16)"

config.adjust_window_size_when_changing_font_size = false
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = false
-- config.macos_fullscreen_extend_behind_notch = true

config.keys = {
  {
    key = "q",
    mods = "CTRL",
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = "'",
    mods = "CTRL",
    action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
  },
  {
    key = "t",
    mods = "SUPER",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

config.bypass_mouse_reporting_modifiers = "SUPER"

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "SUPER",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

local function is_shell(name)
  local shells = { "bash", "zsh", "fish", "sh", "nu" }
  local process = string.match(name, "[^/\\]+$") or name
  for _, s in ipairs(shells) do
    if process == s then
      return true
    end
  end
  return false
end

wezterm.on("open-uri", function(window, pane, uri)
  local editor = "nvim"

  if uri:find("^file:") and not pane:is_alt_screen_active() then
    local url = wezterm.url.parse(uri)
    if is_shell(pane:get_foreground_process_name()) then
      local success, stdout, _ =
        wezterm.run_child_process({ "file", "--brief", "--mime-type", url.file_path })
      if success then
        if stdout:find("directory") then
          pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
          pane:send_text("ls\r")
          return false
        end
        if stdout:find("text") then
          if url.fragment then
            pane:send_text(
              wezterm.shell_join_args({ editor, "+" .. url.fragment, url.file_path }) .. "\r"
            )
          else
            pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
          end
          return false
        end
      end
    end
  end
end)

return config
