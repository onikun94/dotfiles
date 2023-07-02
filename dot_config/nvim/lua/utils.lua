local M = {}
local merge_tb = vim.tbl_deep_extend

M.load_config = function()
  local config = require "default_config"
  config.mappings = require "mappings"
  config.mappings.disabled = nil
  return config
end

M.load_mappings = function(section, mapping_opt)
  local function set_section_map(section_values)
    if section_values.plugin then
      return
    end

    section_values.plugin = nil

    for mode, mode_values in pairs(section_values) do
      local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
      for keybind, mapping_info in pairs(mode_values) do
        local opts = merge_tb("force", default_opts, mapping_info.opts or {})
        mapping_info.opts, opts.mode = nil, nil
        opts.desc = mapping_info[2]

        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end

  local mappings = require("utils").load_config().mappings

  for _, sect in pairs(mappings) do
    set_section_map(sect)
  end
end

return M
