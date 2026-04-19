local M = {}

function M.setup_colors()
  vim.opt.termguicolors = true
  vim.cmd([[
    highlight Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight PmenuSel ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight SignColumn guibg=NONE
  ]])
end

function M.setup_editor()
  vim.o.clipboard = "unnamedplus"
  vim.opt.fillchars = { eob = " " }
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.softtabstop = 0
  vim.o.expandtab = true
  vim.o.number = true
  vim.o.swapfile = false
end

function M.setup_abbreviations()
  vim.cmd("iabbrev imprto import")
  vim.cmd("iabbrev improt import")
  vim.cmd("iabbrev cosnt const")
  vim.cmd("iabbrev consnt const")
  vim.cmd("iabbrev sritng string")
end

function M.setup_keymaps()
  local opts = { noremap = true, silent = true }
  vim.keymap.set("i", "<C-h>", "<Left>", vim.tbl_extend("force", opts, { desc = "move left" }))
  vim.keymap.set("i", "<C-l>", "<Right>", vim.tbl_extend("force", opts, { desc = "move right" }))
  vim.keymap.set("i", "<C-j>", "<Down>", vim.tbl_extend("force", opts, { desc = "move down" }))
  vim.keymap.set("i", "<C-k>", "<Up>", vim.tbl_extend("force", opts, { desc = "move up" }))
  vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", vim.tbl_extend("force", opts, { desc = "delete buffer" }))
end

function M.setup_commands()
  vim.api.nvim_create_user_command("PathCopy", function()
    M.copy_filepath_to_clipboard()
  end, {})
  vim.api.nvim_create_user_command("RPathCopy", function()
    M.copy_relative_filepath_to_clipboard()
  end, {})
  vim.api.nvim_create_user_command("Replace", function(args)
    M.replace_in_buffer(args.fargs[1], args.fargs[2])
  end, { nargs = "+" })
  vim.api.nvim_create_user_command("T", function()
    vim.cmd("split | wincmd j | terminal")
  end, {})
end

function M.copy_filepath_to_clipboard()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("*", filepath)
end

function M.copy_relative_filepath_to_clipboard()
  local filepath = vim.fn.expand("%:.")
  vim.fn.setreg("*", filepath)
  vim.fn.setreg("+", filepath)
end

function M.replace_in_buffer(search, replace)
  vim.cmd(string.format("%%s/%s/%s/gc", search, replace))
end

function M.setup_terminal()
  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
end

function M.setup_cmdline()
  vim.keymap.set("c", "<C-p>", "<Up>", { noremap = true })
  vim.keymap.set("c", "<C-n>", "<Down>", { noremap = true })
end

function M.setup()
  M.setup_colors()
  M.setup_editor()
  M.setup_abbreviations()
  M.setup_keymaps()
  M.setup_commands()
  M.setup_terminal()
  M.setup_cmdline()
  vim.cmd("runtime macros/matchit.vim")
  vim.g.astro_typescript = "enable"
  vim.g.astro_stylus = "enable"
end

return M
