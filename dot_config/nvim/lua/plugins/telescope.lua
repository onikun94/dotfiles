return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>ff",  "<cmd>Telescope find_files<CR>",                                        desc = "find files" },
      { "<leader>fa",  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "find all" },
      { "<leader>fw",  "<cmd>Telescope live_grep<CR>",                                         desc = "live grep" },
      { "<leader>fg",  function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "live grep with args" },
      { "<leader>bb",  "<cmd>Telescope buffers<CR>",                                           desc = "buffers" },
      { "<leader>cc",  "<cmd>Telescope commands<CR>",                                          desc = "commands" },
      { "<leader>ch",  "<cmd>Telescope command_history<CR>",                                   desc = "command history" },
      { "<leader>gbb", "<cmd>Telescope git_branches<CR>",                                      desc = "git branches" },
      { "<leader>gbl", "<cmd>Telescope git_commits<CR>",                                       desc = "git commits" },
      { "<leader>gbc", "<cmd>Telescope git_bcommits<CR>",                                      desc = "git bcommits" },
      { "<leader>gbs", "<cmd>Telescope git_status<CR>",                                        desc = "git status" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
