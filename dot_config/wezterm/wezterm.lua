local wezterm = require("wezterm")
local act = wezterm.action
require("events.tabtitle").setup()
return {
  font = wezterm.font("Hack Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  use_ime = true,
  initial_cols = 260,
  initial_rows = 65,
  font_size = 16.0,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  colors = {
    foreground = "#9ea3c0",
    background = "#222433",
  },
  leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = "-",        mods = "LEADER",       action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    {
      key = "|",
      mods = "LEADER",
      action = wezterm.action({
        SplitHorizontal = { domain = "CurrentPaneDomain" } })
    },
    { key = "h",        mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "j",        mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "k",        mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "l",        mods = "LEADER",       action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "H",        mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J",        mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K",        mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L",        mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "PageUp",   mods = "LEADER",       action = act.ScrollByPage(-1) },
    { key = "PageDown", mods = "LEADER",       action = act.ScrollByPage(1) },
    { key = "P",        mods = "CTRL",         action = act.ActivateCommandPalette },
  },
}
