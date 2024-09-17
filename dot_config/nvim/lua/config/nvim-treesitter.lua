require("nvim-treesitter.configs").setup({
  ensure_installed = "all",  -- one of 'all', 'language', or a list of languages
  ignore_install = { "wing", "smali" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,           -- false will disable the whole extension
    disable = {},            -- list of language that will be disabled
    -- disable = function(lang, bufnr)
    -- 		return lang == "cmake" or ts_disable(lang, bufnr)
    -- end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
