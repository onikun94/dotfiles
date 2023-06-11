require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		--keymap = {
		--	accept = "<C-S-y>",
		--	accept_word = false,
		--	accept_line = false,
		--	next = "<C-S-n>",
		--	prev = "<C-S-p>",
		--	dismiss = "<C-S-]>",
		--},
	},
	panel = {
		enabled = true,
		keymap = {
			open = "<C-S-y>",
		},
	},
	filetypes = {
		["*"] = true, -- disable for all other filetypes and ignore default `filetypes`
	},
})
