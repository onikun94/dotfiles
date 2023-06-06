local M = {}

M.general = {
	i = {
		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "move left" },
		["<C-l>"] = { "<Right>", "move right" },
		["<C-j>"] = { "<Down>", "move down" },
		["<C-k>"] = { "<Up>", "move up" },
	}
}

M.lspconfig = {
	n = {
		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},
		["gr"] = {
			function()
				vim.lsp.buf.declaration()
			end
		},
		["gk"] = {
			function()
				vim.lsp.buf.hover()
			end
		},
		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end
		}
	}
}

--M.nvimtree = {
--	--plugin = true,
--
--	n = {
--		-- toggle
--		["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
--
--		-- focus
--		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
--	}
--}
M.neotree = {
	n = {
		-- toggle
		["<leader>e"] = {
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end
		}
	}
}

M.telescope = {
	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		["<leader>fr"] = { "<cmd> Telescope frecency <CR>", "frecency" },
	}
}

return M
