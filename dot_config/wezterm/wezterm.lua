local wezterm = require 'wezterm';

return {
  --font = wezterm.font("Cica"), -- 自分の好きなフォントいれる
  font = wezterm.font 'JetBrains Mono',
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  initial_cols = 260,
  initial_rows = 65,
  font_size = 14.0,
  --color_scheme = "OneHalfDark", -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  --my setting
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  leader = { key = 'a', mods = 'CMD', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
  },
}
