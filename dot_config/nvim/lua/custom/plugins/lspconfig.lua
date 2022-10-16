local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require ("lspconfig")
local util = require("lspconfig/util")


on_attach = function (client,bufnr)
  local bufopts = {noremap=true,silent=true, buffer=bufnr}
  vim.keymap.set('n','gd',vim.lsp.buf.definition, bufopts)
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


