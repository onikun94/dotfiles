--lazy初期設定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  spec = {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    --{"LazyVim//LazyVim", import = "lazyvim.plugins"},
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
  },
  checker = {
    enable = true,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },

})

--require("lazy").setup(plugins, opts)
