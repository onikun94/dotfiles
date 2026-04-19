return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = "󰚌 ",
        },
      },
      max_concurrent_installers = 10,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.lspconfig")
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "ts_ls", "lua_ls", "tailwindcss", "astro" },
      automatic_enable = true,
    },
  },

  {
    "onsails/lspkind.nvim",
    config = function()
      require("config.lspkind")
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "gp",         "<cmd>Lspsaga peek_definition<CR>",            desc = "peek definition" },
      { "gh",         "<cmd>Lspsaga finder<CR>",                     desc = "lsp finder" },
      { "gr",         "<cmd>Lspsaga rename<CR>",                     desc = "rename" },
      { "gd",         "<cmd>Lspsaga goto_definition<CR>",            desc = "goto definition" },
      { "gk",         "<cmd>Lspsaga hover_doc<CR>",                  desc = "hover doc" },
      { "gt",         "<cmd>Lspsaga peek_type_definition<CR>",       desc = "peek type definition" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>",                desc = "code action" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>",      desc = "line diagnostics" },
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>",       desc = "buffer diagnostics" },
      { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "workspace diagnostics" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",    desc = "cursor diagnostics" },
      { "<leader>o",  "<cmd>Lspsaga outline<CR>",                    desc = "outline" },
    },
    config = function()
      require("config.lspsaga")
    end,
  },
}
