--local config = require("utils").load_config()
vim.g.material_style = "deep ocean"
--透明化
--vim.g.transparency = true
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

--swapfileを作らない
vim.cmd("set noswapfile")

--astron設定
vim.g.astro_typescript = 'enable'
vim.g.astro_stylus = 'enable'

-- hキーの動作を再マッピング: 行の先頭で押すと前の行の末尾へ
vim.api.nvim_set_keymap('n', 'h', 'col(\'.\') == 1 ? \'k$\' : \'h\'', { noremap = true, expr = true, silent = true })

-- lキーの動作を再マッピング: 行の末尾で押すと次の行の先頭へ
vim.api.nvim_set_keymap('n', 'l', 'col(\'.\') == col(\'$\') - 1 ? \'j0\' : \'l\'',
  { noremap = true, expr = true, silent = true })
