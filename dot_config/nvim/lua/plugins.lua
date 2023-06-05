return {
	{
		'nvim-tree/nvim-tree.lua',
		cmd = { "NvimTreeNormal", "NvimTreeToggle", "NvimTreeFocus" },
		init = require("utils").load_mappings "nvimtree",
		--vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "focus nvimtree" }),
		--vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" }),
		dependencies = {
			'nvim-tree/nvim-web-devicons', },
		config = function()
			require('config/nvim-tree')
		end
	},
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim'
		},

		init = require("utils").load_mappings "telescope",
		--keys = {
		--	-- add a keymap to browse plugin files
		--	-- stylua: ignore
		--	{
		--		"<leader>ff",
		--		function()
		--			require("telescope.builtin").find_files(
		--			--{
		--			--  cwd = require("lazy.core.config").options.root
		--			--}
		--			) --検索対象
		--		end,
		--		desc = "Find Plugin File",
		--	},
		--	{
		--		"<leader>fw",
		--		function()
		--			require("telescope.builtin").live_grep(
		--			--{
		--			--cwd = require("lazy.core.config").options.root
		--			--}
		--			)
		--		end,
		--		desc = "Grep Plugin File",
		--	}

		--},
		-- change some options
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('config/tokyonight')
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- lsp stuff
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		opts = function()
			require('config/mason')
		end,

		config = function(_, opts)
			require("mason").setup(opts)
			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require('config/lspconfig')
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		config = function()
			require('config/mason-lspconfig')
		end
	},
	{
		"hrsh7th/nvim-cmp",
		event = 'InsertEnter',
		dependencies = { "onsails/lspkind.nvim", 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path' },
		config = function()
			require('config/cmp')
		end,
	},
	-- or you can return new options to override all the defaults
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				--[[add your custom lualine config here]]
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost" },
		build = ":TSUpdateSync",
		config = function()
			require('config/nvim-treesitter')
		end
	},
	{
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	--  {
	--    "hrsh7th/nvim-cmp",
	--    -- load cmp on InsertEnter
	--    event = "InsertEnter",
	--    -- these dependencies will only be loaded when cmp loads
	--    -- dependencies are always lazy-loaded unless specified otherwise
	--    dependencies = {
	--      "hrsh7th/cmp-nvim-lsp",
	--      "hrsh7th/cmp-buffer",
	--    },
	--    config = function()
	--      -- ...
	--    end,
	--  },
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('config/bufferline')
		end
	},
	--{
	--	'marko-cerovac/material.nvim',
	--	config = function()
	--		require('config/material')
	--	end
	--},
	---- Snippet
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"benfowler/telescope-luasnip.nvim",
		event = "VimEnter",
		config = function()
			require("telescope").load_extension("luasnip")
		end,
	},
}
