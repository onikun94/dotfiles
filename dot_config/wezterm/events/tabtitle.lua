-- thank https://github.com/KevinSilvester/wezterm-config/blob/master/events/tab-title.lua
local wezterm = require("wezterm")


-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614

local GLYPH_SEMI_CIRCLE_LEFT = ""
local GLYPH_SEMI_CIRCLE_RIGHT = ""
local GLYPH_CIRCLE = "●"
local GLYPH_ADMIN = "󰈸"
local GLYPH_PROCESS = "󰏘"

local M = {}

M.cells = {}

M.colors = {
  default = {
    bg = "#313244",
    fg = "#cdd6f4",
  },
  is_active = {
    bg = "#89b4fa",
    fg = "#11111b",
  },

  hover = {
    bg = "#74c7ec",
    fg = "#11111b",
  },
}

M.set_process_name = function(s)
  local process = string.gsub(s, "(.*[/\\])(.*)", "%2")
  process = process:gsub("%.exe$", "")
  
  -- プロセス名に応じたアイコンを返す
  local process_icons = {
    ["node"] = "󰎙 ",
    ["python"] = " ",
    ["vim"] = " ",
    ["nvim"] = " ",
    ["zsh"] = " ",
    ["cargo"] = "󱘗 ",
    ["lua"] = "💎 ",
    ["docker"] = "󰡨 ",
    ["git"] = "󰊢 ",
  }
  
  return process, process_icons[process:lower()] or GLYPH_PROCESS
end

M.get_current_dir = function(base_title)
  -- WezTermのAPIを使用してカレントディレクトリを取得
  local cwd = base_title
  
  -- パスからディレクトリ名を抽出
  local dir_name = cwd:match("[^/\\]*$")
  if not dir_name or dir_name == "" then
    dir_name = cwd
  end
  
  -- ホームディレクトリのパスを取得
  local home = os.getenv("HOME")
  if home then
    -- ホームディレクトリパスを "~" に置換
    dir_name = dir_name:gsub("^" .. home:gsub("[-%.%+%[%]%(%)%$%^%%%?%*]", "%%%0") .. "/", "~/")
  end
  
  return dir_name
end

M.set_title = function(process_name, base_title, max_width, inset)
  local title
  inset = inset or 6
  
  local process, icon = M.set_process_name(process_name)
  local dir = M.get_current_dir(base_title)

  if process:len() > 0 then
    -- プロセス名とディレクトリ名を組み合わせる
    title = icon .. " " .. (dir or "")
  else
    title = dir or ""
  end

  return title
end

M.check_if_admin = function(p)
  if p:match("^Administrator: ") then
    return true
  end
  return false
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
M.push = function(bg, fg, attribute, text)
  table.insert(M.cells, { Background = { Color = bg } })
  table.insert(M.cells, { Foreground = { Color = fg } })
  table.insert(M.cells, { Attribute = attribute })
  table.insert(M.cells, { Text = text })
end

M.setup = function()
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    M.cells = {}

    local bg
    local fg
    -- カレントディレクトリを取得
    local cwd = tab.active_pane.current_working_dir
    local process_name = M.set_process_name(tab.active_pane.foreground_process_name)
    local is_admin = M.check_if_admin(tab.active_pane.title)
    local title = M.set_title(process_name, cwd and cwd.file_path or tab.active_pane.title, max_width, (is_admin and 8))

    if tab.is_active then
      bg = M.colors.is_active.bg
      fg = M.colors.is_active.fg
    elseif hover then
      bg = M.colors.hover.bg
      fg = M.colors.hover.fg
    else
      bg = M.colors.default.bg
      fg = M.colors.default.fg
    end

    local has_unseen_output = false
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end

    -- Left semi-circle
    M.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_LEFT)

    -- Left padding
    M.push(bg, fg, { Intensity = "Bold" }, "   ")

    -- Admin Icon
    if is_admin then
      M.push(bg, "#f38ba8", { Intensity = "Bold" }, " " .. GLYPH_ADMIN)
    end

    -- Title
    M.push(bg, fg, { Intensity = "Bold" }, " " .. title .. " ")

    -- Unseen output alert
    if has_unseen_output then
      M.push(bg, "#fab387", { Intensity = "Bold" }, " " .. GLYPH_CIRCLE)
    end

    -- Right padding
    M.push(bg, fg, { Intensity = "Bold" }, "   ")

    -- Right semi-circle
    M.push(fg, bg, { Intensity = "Bold" }, GLYPH_SEMI_CIRCLE_RIGHT)

    return M.cells
  end)
end

return M