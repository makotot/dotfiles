local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on('format-tab-title', function(tab)
  local pane = tab.active_pane
  local title = pane.title
  if pane.domain_name then
    title = title .. ' - (' .. pane.domain_name .. ')'
  end
  return title
end)

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
}
