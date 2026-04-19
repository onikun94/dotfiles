-- Inspired by https://github.com/KevinSilvester/wezterm-config/blob/master/events/tab-title.lua
-- https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614
local wezterm = require("wezterm")

local GLYPH_SEMI_CIRCLE_LEFT = ""
local GLYPH_SEMI_CIRCLE_RIGHT = ""
local GLYPH_ADMIN = "󰈸"
local GLYPH_PROCESS = "󰏘"
local GLYPH_ZOOM = "󰍉"

local TAB_PAD = "    "  -- タブ左右の余白 (4スペース)
local MIN_TITLE_WIDTH = 28  -- タイトルが短くてもこの幅分までパディング

local PROCESS_ICONS = {
  node = "󰎙 ",
  python = "",
  vim = "",
  nvim = "",
  zsh = "",
  cargo = "󱘗 ",
  lua = "💎 ",
  docker = "󰡨 ",
  git = "󰊢 ",
  claude = "󱚝 ",
}

local COLORS = {
  default          = { bg = "#313244", fg = "#cdd6f4" },
  is_active        = { bg = "#89b4fa", fg = "#11111b" },
  hover            = { bg = "#74c7ec", fg = "#11111b" },
  bell             = { bg = "#fab387", fg = "#11111b" }, -- Claude Code の入力待ちタブを強調
  claude           = { bg = "#7c3aed", fg = "#f5f5ff" }, -- Claude Code 実行中の紫
  claude_is_active = { bg = "#a78bfa", fg = "#11111b" }, -- Claude Code 実行中でアクティブ
}

local M = {}

local function parse_process(raw)
  local process = (raw or ""):gsub("(.*[/\\])(.*)", "%2"):gsub("%.exe$", "")
  local icon = PROCESS_ICONS[process:lower()] or GLYPH_PROCESS
  return process, icon
end

local function dir_basename(path)
  if not path or path == "" then return "" end
  local trimmed = path:gsub("[/\\]+$", "")
  return trimmed:match("[^/\\]+$") or trimmed
end

local function is_admin(title)
  return title and title:match("^Administrator: ") ~= nil
end

local function push(cells, bg, fg, text)
  table.insert(cells, { Background = { Color = bg } })
  table.insert(cells, { Foreground = { Color = fg } })
  table.insert(cells, { Attribute = { Intensity = "Bold" } })
  table.insert(cells, { Text = text })
end

local function is_claude(pane)
  local proc = (pane.foreground_process_name or ""):lower()
  local title = (pane.title or ""):lower()
  return proc:match("claude") ~= nil or title:match("claude") ~= nil
end

local function pick_colors(tab, hover, has_bell, claude)
  if has_bell then return COLORS.bell end
  if tab.is_active then
    return claude and COLORS.claude_is_active or COLORS.is_active
  end
  if hover then return COLORS.hover end
  if claude then return COLORS.claude end
  return COLORS.default
end

-- Claude Code などが bell (\a) を送ると該当タブに通知マーカーを立てる
M.bell_tabs = {}

M.setup = function()
  wezterm.on("bell", function(_window, pane)
    local tab = pane:tab()
    if tab then
      M.bell_tabs[tab:tab_id()] = true
    end
  end)

  wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, hover, _max_width)
    local pane = tab.active_pane
    local _, icon = parse_process(pane.foreground_process_name)
    local dir = dir_basename(pane.current_working_dir and pane.current_working_dir.file_path or pane.title)
    local title = icon .. " " .. dir
    -- 最小幅に満たない場合は右側をスペースでパディング
    local title_width = wezterm.column_width(title)
    if title_width < MIN_TITLE_WIDTH then
      title = title .. string.rep(" ", MIN_TITLE_WIDTH - title_width)
    end

    if tab.is_active then
      M.bell_tabs[tab.tab_id] = nil
    end
    local has_bell = M.bell_tabs[tab.tab_id] == true
    local claude = is_claude(pane)

    local c = pick_colors(tab, hover, has_bell, claude)
    local admin = is_admin(pane.title)
    local cells = {}

    push(cells, c.fg, c.bg, GLYPH_SEMI_CIRCLE_LEFT)
    push(cells, c.bg, c.fg, TAB_PAD)
    if admin then
      push(cells, c.bg, "#f38ba8", GLYPH_ADMIN .. " ")
    end
    push(cells, c.bg, c.fg, title)
    if pane.is_zoomed then
      push(cells, c.bg, "#f9e2af", " " .. GLYPH_ZOOM)
    end
    push(cells, c.bg, c.fg, TAB_PAD)
    push(cells, c.fg, c.bg, GLYPH_SEMI_CIRCLE_RIGHT)

    return cells
  end)
end

return M
