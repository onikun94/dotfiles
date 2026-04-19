local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
    { "folke/neoconf.nvim",   cmd = "Neoconf" },
    "folke/neodev.nvim",
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
  },
  checker = {
    enable = true,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
})
