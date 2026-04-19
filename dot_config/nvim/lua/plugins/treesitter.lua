return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdateSync",
    config = function()
      require("config.nvim-treesitter")
    end,
  },
}
