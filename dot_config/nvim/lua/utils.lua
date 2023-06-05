local M = {}
local merge_tb = vim.tbl_deep_extend

M.load_config = function()
	local config = require "default_config"
	config.mappings = require "mappings"
	config.mappings.disabled = nil
	return config
end

M.load_mappings = function(section, mapping_opt)
	--print("hoge3")
	local function set_section_map(section_values)
		--print("hoge4")
		--print(section_values.plugin)
		--print("hoge5")
		if section_values.plugin then
			return
		end

		--print("hoge5")
		section_values.plugin = nil

		--print("hoge6")
		for mode, mode_values in pairs(section_values) do
			--print("hoge7")
			--print(mode)
			--print("------")
			--print(mode_values)
			local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
			--print("hoge8")
			--print(default_opts)
			for keybind, mapping_info in pairs(mode_values) do
				--print("keybind = ", keybind)
				-- merge default + user opts
				--print("hoge9")
				local opts = merge_tb("force", default_opts, mapping_info.opts or {})

				--print("mapping_info[0]", mapping_info[0])
				--print("mapping_info[1]", mapping_info[1])
				--print("mapping_info[2]", mapping_info[2])
				mapping_info.opts, opts.mode = nil, nil
				opts.desc = mapping_info[2]
				--print("hoge10")

				vim.keymap.set(mode, keybind, mapping_info[1], opts)
				--print("end")
			end
		end
	end

	local mappings = require("utils").load_config().mappings

	--if type(section) == "string" then
	--	print("hogehoge")
	--	print(section)
	--	mappings[section]["plugin"] = nil
	--	mappings = { mappings[section] }
	--end
	for _, sect in pairs(mappings) do
		set_section_map(sect)
	end
end

return M
