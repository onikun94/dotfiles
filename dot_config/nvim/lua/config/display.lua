local M = {}

function M.setup_colors()
  vim.g.material_style = "deep ocean"
  vim.opt.termguicolors = true
  vim.cmd [[
    highlight Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight PmenuSel ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight SignColumn guibg=NONE
  ]]
end

function M.setup_editor()
  vim.o.clipboard = "unnamedplus"
  vim.opt.fillchars = { eob = " " }
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.softtabstop = 0
  vim.o.expandtab = true
  vim.cmd("set number")
  vim.cmd("set noswapfile")
end

function M.setup_abbreviations()
  vim.cmd("iabbrev imprto import")
  vim.cmd("iabbrev improt import")
  vim.cmd("iabbrev cosnt const")
  vim.cmd("iabbrev consnt const")
  vim.cmd("iabbrev sritng string")
end

function M.setup_keymaps()
  vim.api.nvim_set_keymap('n', 'h', 'col(\'.\') == 1 ? \'k$\' : \'h\'', { noremap = true, expr = true, silent = true })
  vim.api.nvim_set_keymap('n', 'l', 'col(\'.\') == col(\'$\') - 1 ? \'j0\' : \'l\'', { noremap = true, expr = true, silent = true })
end

function M.setup_commands()
  vim.cmd("command! PathCopy lua require('config.display').copy_filepath_to_clipboard()")
  vim.cmd("command! RPathCopy lua require('config.display').copy_relative_filepath_to_clipboard()")
  vim.cmd("command! -nargs=+ Replace lua require('config.display').replace_in_buffer(<f-args>)")
  vim.cmd("command! T split | wincmd j | terminal")
end

function M.copy_filepath_to_clipboard()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('*', filepath)
end

function M.copy_relative_filepath_to_clipboard()
  local filepath = vim.fn.expand('%:.')
  vim.fn.setreg('*', filepath)
  vim.fn.setreg('+', filepath)
end

function M.replace_in_buffer(search, replace)
  local command = string.format("%%s/%s/%s/gc", search, replace)
  vim.cmd(command)
end

function M.setup_terminal()
  vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
end

function M.setup_cmdline()
  vim.api.nvim_set_keymap('c', '<C-p>', '<Up>', { noremap = true })
  vim.api.nvim_set_keymap('c', '<C-n>', '<Down>', { noremap = true })
end

function M.setup()
  M.setup_colors()
  M.setup_editor()
  M.setup_abbreviations()
  M.setup_keymaps()
  M.setup_commands()
  M.setup_terminal()
  M.setup_cmdline()
  vim.cmd('runtime macros/matchit.vim')
  vim.g.astro_typescript = 'enable'
  vim.g.astro_stylus = 'enable'
end

return M
