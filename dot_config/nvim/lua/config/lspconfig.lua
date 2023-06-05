local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.format() end
		})
	end
end
lspconfig.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" }
}

lspconfig.lua_ls.setup {
	on_attach = on_attach,
}

--vim.api.nvim_create_autocmd('LspAttach', {
--  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--  callback = function(ev)
--    -- Enable completion triggered by <c-x><c-o>
--    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--    -- Buffer local mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local opts = { buffer = ev.buf }
--    vim.keymap.set('n', 'gr', vim.lsp.buf.declaration, opts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--    vim.keymap.set('n', '<space>wl', function()
--      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end, opts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--    vim.keymap.set('n', '<space>f', function()
--      vim.lsp.buf.format { async = true }
--    end, opts)
--  end,
--})
