local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },
  },
  n = {
    -- del buffer
    ["<leader>x"] = { "<cmd> bd <CR>", "delete buffer" },
  }
}

M.lspsaga = {
  n = {
    ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "peek_definition" },
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp_finder" },
    ["gr"] = { "<cmd>Lspsaga rename<CR>", "rename" },
    ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "goto_definition" },
    ["gk"] = { "<Cmd>Lspsaga hover_doc<CR>", "hober def" },
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "peek_type_definition" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code_action" },
    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show_line_diagnostics" },
    ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show_buf_diagnostics" },
    ["<leader>sw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "show_workspace_diagnostics" },
    ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show_cursor_diagnostics" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>" }
  }
}
M.neotree = {
  n = {
    -- toggle
    ["<leader>e"] = {
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end
    }
  }
}

M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>bb"] = { "<cmd> Telescope buffers <CR>", "buffers" },
    ["<leader>cc"] = { "<cmd> Telescope commands <CR>", "commands" },
    ["<leader>ch"] = { "<cmd> Telescope command_history <CR>", "command_history" },
    ["<leader>gbb"] = { "<cmd> Telescope git_branches <CR>", "git_branches" },
    ["<leader>gbl"] = { "<cmd> Telescope git_commits <CR>", "git_commits" },
    ["<leader>gbc"] = { "<cmd> Telescope git_bcommits <CR>", "git_bcommits" },
    ["<leader>gbs"] = { "<cmd> Telescope git_status <CR>", "git_status" },

  }
}

M.bufferline = {
  n = {
    ["<Tab>"] = { "<Cmd> BufferLineCycleNext <CR>", "buffer next" },
    ["<S-Tab>"] = { "<Cmd> BufferLineCyclePrev <CR>", "buffer prev" },
    ["<leader>l"] = { "<Cmd> BufferLineMoveNext <CR>", "buffer move" },
    ["<leader>h"] = { "<Cmd> BufferLineMovePrev <CR>", "buffer move" },
  }
}

M.copilot = {
  n = {
    ["<leader>c"] = { "<Cmd> Copilot panel <CR>", "copilot panel" }
  }
}
return M
