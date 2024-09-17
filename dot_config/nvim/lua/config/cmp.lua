local cmp = require("cmp")


cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      --vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = "copilot", priority = 90 },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = "emoji",   insert = true, priority = 60 },
    { name = "path",    priority = 100 },
    { name = "buffer",  priority = 80 },
  }),
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        cmp_tabnine = "[TabNine]",
        copilot = "[Copilot]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[NeovimLua]",
        latex_symbols = "[LaTeX]",
        path = "[Path]",
        emoji = "[Emoji]",
        calc = "[Calc]",
        rg = "[Rg]",
        treesitter = "[TS]",
        dictionary = "[Dictionary]",
        mocword = "[mocword]",
        cmdline = "[Cmd]",
        cmdline_history = "[History]",
      },
    })
  }

})

--vim.cmd [[
--  set completeopt=menuone,noinsert,noselect
--  highlight! default link CmpItemKind CmpItemMenuDefault
--]]
