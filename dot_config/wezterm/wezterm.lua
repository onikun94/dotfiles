local wezterm = require("wezterm")
local act = wezterm.action
require("events.tabtitle").setup()

return {
  -- フォントと表示
  font = wezterm.font_with_fallback({
    "Hack Nerd Font",
    "Hiragino Kaku Gothic ProN",
  }),
  font_size = 16.0,
  initial_cols = 260,
  initial_rows = 65,

  -- IME設定
  use_ime = true,

  -- ウィンドウ設定
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",

  -- カラー設定
  colors = {
    foreground = "#9ea3c0",
    background = "#222433",
  },

  -- キーバインド設定
  leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    -- ペイン操作
    { key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "|", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
    { key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
    { key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
    { key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
    -- ペインサイズ調整
    { key = "H", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },
    -- スクロール
    { key = "PageUp", mods = "LEADER", action = act.ScrollByPage(-1) },
    { key = "PageDown", mods = "LEADER", action = act.ScrollByPage(1) },
    -- その他
    { key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
  },
}
