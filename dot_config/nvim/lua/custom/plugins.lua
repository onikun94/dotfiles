local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "zbirenbaum/copilot.lua",
    --lazy = true,
    --cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function()
        require "custom/configs/copilot"
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require "custom/cunfigs/copilot-cmp"
    end,
    --  config = function ()
    --    require("copilot_cmp").setup({
    --      method = "getCompletionsCycling",
    --			formatters = {
    --				label = require("copilot_cmp.format").format_label_text,
    --				insert_text = require("copilot_cmp.format").format_insert_text,
    --				preview = require("copilot_cmp.format").deindent,
    --			},
    --    })
    --  end
  },
  --{
  --  "hrsh7th/nvim-cmp",
  --  dependencies = {
  --    {
  --      "zbirenbaum/copilot-cmp",
  --      dependencies = "copilot.lua",
  --      opts = {},
  --      config = function(_, opts)
  --        local copilot_cmp = require "copilot_cmp"
  --        copilot_cmp.setup(opts)
  --        -- attach cmp source whenever copilot attaches
  --        -- fixes lazy-loading issues with the copilot cmp source
  --      end,
  --    },
  --  },
  --},

  --{
  --  "windwp/nvim-autopairs",
  --  enabled = false,
  --}

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
}

return plugins
