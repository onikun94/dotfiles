local wezterm = require("wezterm")
local act = wezterm.action

require("events.tabtitle").setup()

local function split(direction)
  return act({ ["Split" .. direction] = { domain = "CurrentPaneDomain" } })
end

local function move_pane(direction)
  return act({ ActivatePaneDirection = direction })
end

local function resize_pane(direction)
  return act({ AdjustPaneSize = { direction, 5 } })
end

local keys = {
  -- ペイン分割・移動
  { key = "-", mods = "LEADER",       action = split("Vertical") },
  { key = "|", mods = "LEADER",       action = split("Horizontal") },
  { key = "h", mods = "LEADER",       action = move_pane("Left") },
  { key = "j", mods = "LEADER",       action = move_pane("Down") },
  { key = "k", mods = "LEADER",       action = move_pane("Up") },
  { key = "l", mods = "LEADER",       action = move_pane("Right") },
  -- ペインサイズ調整
  { key = "H", mods = "LEADER|SHIFT", action = resize_pane("Left") },
  { key = "J", mods = "LEADER|SHIFT", action = resize_pane("Down") },
  { key = "K", mods = "LEADER|SHIFT", action = resize_pane("Up") },
  { key = "L", mods = "LEADER|SHIFT", action = resize_pane("Right") },
  -- タブ操作
  { key = "c", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
  { key = "x", mods = "LEADER",       action = act.CloseCurrentPane({ confirm = true }) },
  { key = "n", mods = "LEADER",       action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
  -- ズーム・検索・Quick Select
  { key = "z",        mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "/",        mods = "LEADER", action = act.Search({ CaseInSensitiveString = "" }) },
  { key = " ",        mods = "LEADER", action = act.QuickSelect },
  -- スクロール・コピーモード
  { key = "PageUp",   mods = "LEADER", action = act.ScrollByPage(-1) },
  { key = "PageDown", mods = "LEADER", action = act.ScrollByPage(1) },
  { key = "[",        mods = "LEADER", action = act.ActivateCopyMode },
  -- その他
  { key = "P", mods = "CTRL",       action = act.ActivateCommandPalette },
  { key = "{", mods = "CTRL|SHIFT", action = act.MoveTab(0) },
}

-- LEADER + 1..9 で直接タブ切替
for i = 1, 9 do
  table.insert(keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

return {
  -- フォントと表示
  font = wezterm.font_with_fallback({
    "Hack Nerd Font",
    "Hiragino Kaku Gothic ProN",
  }),
  font_size = 16.0,
  initial_cols = 260,
  initial_rows = 65,

  -- 入力・ウィンドウ
  use_ime = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  window_padding = { left = 8, right = 8, top = 4, bottom = 4 },

  -- タブバー
  show_new_tab_button_in_tab_bar = false,
  tab_max_width = 200,

  -- ベル (音・画面フラッシュ共にオフ。通知はタブ色の変化のみで行う)
  audible_bell = "Disabled",

  -- スクロールバック
  scrollback_lines = 10000,

  -- カラー
  colors = {
    foreground = "#9ea3c0",
    background = "#222433",
    tab_bar = {
      background = "#222433",
    },
  },

  -- キーバインド
  leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = keys,
}
