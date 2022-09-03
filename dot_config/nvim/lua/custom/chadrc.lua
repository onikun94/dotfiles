-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
M.plugins = {
  user = require "custom.plugins",
  override = require "custom.override",
}

M.ui = {
  theme = "ayu-dark",
}

return M
