local bg_tab      = "#292e42"
local bg_selected = "#7aa2f7"
local fg_selected = "#1a1b26"

require("bufferline").setup({
  options = {
    separator_style = { "\u{E0B6}", "\u{E0B4}" },
    indicator = { style = "none" },
    show_buffer_close_icons = false,
    show_close_icon = false,
    modified_icon = "\u{25CF}",
    tab_size = 20,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = false,
      },
    },
  },
  highlights = {
    fill                 = { bg = "NONE" },
    background           = { bg = bg_tab,      fg = "#565f89" },
    buffer_visible       = { bg = bg_tab,      fg = "#a9b1d6" },
    buffer_selected      = { bg = bg_selected, fg = fg_selected, bold = true },
    modified             = { bg = bg_tab,      fg = "#e0af68" },
    modified_visible     = { bg = bg_tab,      fg = "#e0af68" },
    modified_selected    = { bg = bg_selected, fg = "#c53b53" },
    separator            = { bg = "NONE",      fg = bg_tab },
    separator_visible    = { bg = "NONE",      fg = bg_tab },
    separator_selected   = { bg = "NONE",      fg = bg_selected },
    tab_separator        = { bg = "NONE",      fg = bg_tab },
    tab_separator_selected = { bg = "NONE",    fg = bg_selected },
    offset_separator     = { bg = "NONE",      fg = bg_tab },
  },
})
