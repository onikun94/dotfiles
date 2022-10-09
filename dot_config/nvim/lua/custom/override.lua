return {
  ["williamboman/mason.nvim"] = {
    -- :Mason
    -- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
    ensure_installed = {
      -- lua
      "lua-language-server",
      "stylua",

      --webdev
      "typescript-language-server",
      "tailwindcss-language-server",
      "tailwindcss"

    },
  },

 ["NvChad/ui"] = {
    --NvChad-after = "base46",
    module = "nvchad_ui",
    statusline = {
      separator_style = "default",
      overriden_modules = nil,
    },
    tabufline = {
      lazyload = false, -- to show tabufline by default
   },
    config = function()
      require("plugins.configs.others").nvchad_ui()
    end,
  },

}
