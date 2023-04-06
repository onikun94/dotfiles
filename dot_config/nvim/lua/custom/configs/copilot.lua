require("copilot").setup({
  suggestion = {
    --enabled = false,
    auto_trigger = true,
    keymap = {
      --accept = "<Tab>",
      --accept_word = false,
      --accept_line = false,
    },
  },
  completion = {
    enabled = true,
    auto_trigger = true
  },
  --panel = { enabled = false },

})
vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>Copilot<CR>', {noremap = true, silent = true})
--vim.keymap.set("i", "<C-S-e>", function()
--	require("cmp").mapping.abort()
--	require("copilot.suggestion").accept()
--end, {
--	desc = "[copilot] accept suggestion",
--	silent = true,
--})
