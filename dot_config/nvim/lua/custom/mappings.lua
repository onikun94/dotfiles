---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gk"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
  },
}

-- more keybinds!

return M
