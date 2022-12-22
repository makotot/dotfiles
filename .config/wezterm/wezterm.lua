local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local function format_title(dir, max_width)
  local width = max_width - 2
  local dir_char_length = #dir

  if width < dir_char_length then
    return '..' .. wezterm.truncate_left(dir, width) .. ' '
  end
  return ' ' .. dir .. ' '
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = format_title(tab.active_pane.current_working_dir, max_width)

    if tab.is_active then
      return {
        { Background = { Color = '#523ef5' } },
        { Foreground = { Color = '#fff' } },
        { Text = title },
      }
    end

    return title
  end
)

return {
  automatically_reload_config = true,
  color_scheme = "AyuDark (Gogh)",
  font = wezterm.font("SauceCodePro Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),
  font_size = 11.0,
  tab_bar_at_bottom = true,
  tab_max_width = 16,
  use_fancy_tab_bar = true,
  use_ime = true,
  window_background_opacity = 1.0,
  inactive_pane_hsb = {
    saturation = 0.6,
    brightness = 0.7,
  },

  keys = {
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
      key = "LeftArrow",
      mods = "OPT",
      action = wezterm.action.SplitPane{
        direction = "Left",
        size = { Percent = 50 },
      },
    },
    {
      key = "RightArrow",
      mods = "OPT",
      action = wezterm.action.SplitPane{
        direction = "Right",
        size = { Percent = 50 },
      },
    },
    {
      key = "UpArrow",
      mods = "OPT",
      action = wezterm.action.SplitPane{
        direction = "Up",
        size = { Percent = 50 },
      },
    },
    {
      key = "DownArrow",
      mods = "OPT",
      action = wezterm.action.SplitPane{
        direction = "Down",
        size = { Percent = 50 },
      },
    },
  }
}
