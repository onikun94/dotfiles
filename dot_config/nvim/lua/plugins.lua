return {
  --{
  --	'nvim-tree/nvim-tree.lua',
  --	cmd = { "NvimTreeNormal", "NvimTreeToggle", "NvimTreeFocus" },
  --	init = require("utils").load_mappings "nvimtree",
  --	dependencies = {
  --		'nvim-tree/nvim-web-devicons', },
  --	config = function()
  --		require('config/nvim-tree')
  --	end
  --},
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
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
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
    "onsails/lspkind.nvim",
    config = function()
      require('config/lspkind')
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-buffer',
      {
        "zbirenbaum/copilot-cmp",
        config = true
      },
    },
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
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('config/bufferline')
    end
  },
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
  --------------------------------
  -- Filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    cmd = "Neotree",
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
    branch = "v2.x",
    --cmd = { "NeoTree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo-tree')
    end
    --event = "VimEnter",
  },

  --------------------------------
  --{
  --	"folke/edgy.nvim",
  --	event = "VeryLazy",
  --	opts = {
  --		bottom = {
  --			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
  --			{ ft = "toggleterm",    size = { height = 0.4 } },
  --			{
  --				ft = "lazyterm",
  --				title = "LazyTerm",
  --				size = { height = 0.4 },
  --				filter = function(buf)
  --					return not vim.b[buf].lazyterm_cmd
  --				end,
  --			},
  --			"Trouble",
  --			{ ft = "qf",            title = "QuickFix" },
  --			{ ft = "help",          size = { height = 20 } },
  --			{ ft = "spectre_panel", size = { height = 0.4 } },
  --		},
  --		left = {
  --			-- Neo-tree filesystem always takes half the screen height
  --			{
  --				title = "Neo-Tree",
  --				ft = "neo-tree",
  --				filter = function(buf)
  --					return vim.b[buf].neo_tree_source == "filesystem"
  --				end,
  --				size = { height = 0.5 },
  --			},
  --			{
  --				title = "Neo-Tree Git",
  --				ft = "neo-tree",
  --				filter = function(buf)
  --					return vim.b[buf].neo_tree_source == "git_status"
  --				end,
  --				size = { height = 0.2 },
  --				pinned = true,
  --				open = "Neotree position=right git_status",
  --			},
  --		},
  --	},
  --},
  ------
  --{ 'akinsho/toggleterm.nvim', version = "*", config = true }
  --
  -- tell cmp to use luasnip as a sources
  --{ 'saadparwaiz1/cmp_luasnip' },leader

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function()
        --require("copilot").setup()
        require("config/copilot")
      end, 100)
    end,
  },

  --{
  --  "nvim-telescope/telescope-frecency.nvim",
  --  config = function()
  --    require("telescope").load_extension("frecency")
  --  end,
  --  dependencies = { "kkharji/sqlite.lua" },
  --},


  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("config/lspsaga")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    'wuelnerdotexe/vim-astro'
  },
  {
    "machakann/vim-sandwich",
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "dinhhuy258/git.nvim",
    config = function()
      --require("config/git")
      require("git").setup()
    end,
  },
}
