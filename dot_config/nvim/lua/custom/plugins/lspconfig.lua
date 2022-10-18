local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require ("lspconfig")
local util = require("lspconfig/util")

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>m', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

on_attach = function (client,bufnr)
  local bufopts = {noremap=true,silent=true, buffer=bufnr}
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n','gd',vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gd<Space>', ':split | lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gd<CR>', ':vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
-- :h lspconfig-all
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "tsserver","tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern 'tsconfig.json'(fname)
        or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
    end,
  }
end


