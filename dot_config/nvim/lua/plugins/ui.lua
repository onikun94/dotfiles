return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("config.tokyonight")
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.alpha")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Tab>",     "<Cmd>BufferLineCycleNext<CR>", desc = "buffer next" },
      { "<S-Tab>",   "<Cmd>BufferLineCyclePrev<CR>", desc = "buffer prev" },
      { "<leader>l", "<Cmd>BufferLineMoveNext<CR>",  desc = "buffer move next" },
      { "<leader>h", "<Cmd>BufferLineMovePrev<CR>",  desc = "buffer move prev" },
    },
    config = function()
      require("config.bufferline")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "tokyonight" },
    },
  },

  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
}
