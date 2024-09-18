local M = {}

if vim.g.vscode then
  -- VSCode extension
  M.vscode = {
    n = {
      ["gd"] = { "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", "goto definition" },
      ["gk"] = { "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>", "peek definition" },
      ["<leader>ff"] = { "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", "quick open" },
      ["<leader>d"] = { "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>", "save file" },
      ["H"] = { "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", "previous editor" },
      ["L"] = { "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", "next editor" },
      ["<leader>s"] = { "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", "split editor down" },
      ["<C-w>v"] = { "<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>", "split editor right" },
      ["<C-w>c"] = { "<Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>", "close editors in group" },
      ["<leader>fw"] = { "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>", "find in files" },
      ["<leader>e"] = { "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", "toggle sidebar" },
      ["<leader>fe"] = { "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>", "focus explorer" },
    }
  }
else
  -- 既存の設定をそのまま使用
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
      ["gh"] = { "<cmd>Lspsaga finder<CR>", "lsp_finder" },
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
      ["<space>e"] = { ":Neotree toggle<CR>", noremap = true, silent = true }
    }
  }
  M.telescope = {
    n = {
      -- find
      ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
      ["<leader>o"] = { "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", "quick open" },
      ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
      ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
      ["<leader>fg"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        "live grep with args" },
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
  M.lazygit = {
    n = {
      ["<leader>lg"] = { "<Cmd> LazyGit <CR>", "LazyGit" }
    }
  }
end

return M
