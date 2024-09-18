return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
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
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
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
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo-tree')
    end
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      --require('lspsaga').setup({})
      require("config/lspsaga")
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'      -- optional
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
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("config/none-ls")
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
}
