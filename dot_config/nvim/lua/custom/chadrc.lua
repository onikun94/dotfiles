---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
--local highlights = require "custom.highlights"

M.ui = {
  transparency = true,
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "one_light" },
  statusline = {
    theme = "minimal",
    separator_style = "round"
  },
  cmp = {
    style = 'atom',
  },
  nvdash = {
    load_on_startup = true,
  },
  --hl_override = highlights.override,
  --hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
