--local config = require("utils").load_config()
vim.g.material_style = "deep ocean"
--透明化
vim.g.transparency = true
-- clipboard
vim.o.clipboard = "unnamedplus"
-- miniwindowをなくす
vim.cmd [[
  highlight Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
  highlight PmenuSel ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
]]
--~をなくす
vim.opt.fillchars = { eob = " " }

vim.opt.termguicolors = true

vim.cmd('highlight SignColumn guibg=NONE')

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--tabの間隔とか
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0
vim.o.expandtab = true

-- tablineの設定
vim.opt.termguicolors = true


--abbreviations
vim.cmd("iabbrev imprto import")
vim.cmd("iabbrev improt import")

--行番号
vim.cmd("set number")

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
