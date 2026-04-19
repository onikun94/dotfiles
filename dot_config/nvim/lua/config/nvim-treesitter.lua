require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = { "wing", "smali" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
