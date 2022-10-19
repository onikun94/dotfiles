local overrides = require "custom.plugins.overrides"

return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["wakatime/vim-wakatime"] = {},

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["windwp/nvim-ts-autotag"] = {
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
}
