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
    always_show_bufferline = true,
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
    fill                     = { bg = "NONE" },

    background               = { bg = bg_tab,      fg = "#565f89" },
    buffer_visible           = { bg = bg_tab,      fg = "#a9b1d6" },
    buffer_selected          = { bg = bg_selected, fg = fg_selected, bold = true },

    modified                 = { bg = bg_tab,      fg = "#e0af68" },
    modified_visible         = { bg = bg_tab,      fg = "#e0af68" },
    modified_selected        = { bg = bg_selected, fg = "#c53b53" },

    separator                = { bg = "NONE",      fg = bg_tab },
    separator_visible        = { bg = "NONE",      fg = bg_tab },
    separator_selected       = { bg = "NONE",      fg = bg_selected },

    tab_separator            = { bg = "NONE",      fg = bg_tab },
    tab_separator_selected   = { bg = "NONE",      fg = bg_selected },

    offset_separator         = { bg = "NONE",      fg = bg_tab },

    duplicate                = { bg = bg_tab,      fg = "#565f89", italic = false },
    duplicate_visible        = { bg = bg_tab,      fg = "#a9b1d6", italic = false },
    duplicate_selected       = { bg = bg_selected, fg = fg_selected, italic = false, bold = true },

    numbers                  = { bg = bg_tab,      fg = "#565f89" },
    numbers_visible          = { bg = bg_tab,      fg = "#a9b1d6" },
    numbers_selected         = { bg = bg_selected, fg = fg_selected, bold = true },

    diagnostic               = { bg = bg_tab,      fg = "#565f89" },
    diagnostic_visible       = { bg = bg_tab,      fg = "#a9b1d6" },
    diagnostic_selected      = { bg = bg_selected, fg = fg_selected, bold = true },

    hint                     = { bg = bg_tab,      fg = "#1abc9c" },
    hint_visible             = { bg = bg_tab,      fg = "#1abc9c" },
    hint_selected            = { bg = bg_selected, fg = "#1abc9c", bold = true },
    hint_diagnostic          = { bg = bg_tab,      fg = "#1abc9c" },
    hint_diagnostic_visible  = { bg = bg_tab,      fg = "#1abc9c" },
    hint_diagnostic_selected = { bg = bg_selected, fg = "#1abc9c", bold = true },

    info                     = { bg = bg_tab,      fg = "#0db9d7" },
    info_visible             = { bg = bg_tab,      fg = "#0db9d7" },
    info_selected            = { bg = bg_selected, fg = "#0db9d7", bold = true },
    info_diagnostic          = { bg = bg_tab,      fg = "#0db9d7" },
    info_diagnostic_visible  = { bg = bg_tab,      fg = "#0db9d7" },
    info_diagnostic_selected = { bg = bg_selected, fg = "#0db9d7", bold = true },

    warning                  = { bg = bg_tab,      fg = "#e0af68" },
    warning_visible          = { bg = bg_tab,      fg = "#e0af68" },
    warning_selected         = { bg = bg_selected, fg = "#e0af68", bold = true },
    warning_diagnostic       = { bg = bg_tab,      fg = "#e0af68" },
    warning_diagnostic_visible  = { bg = bg_tab,  fg = "#e0af68" },
    warning_diagnostic_selected = { bg = bg_selected, fg = "#e0af68", bold = true },

    error                    = { bg = bg_tab,      fg = "#db4b4b" },
    error_visible            = { bg = bg_tab,      fg = "#db4b4b" },
    error_selected           = { bg = bg_selected, fg = "#db4b4b", bold = true },
    error_diagnostic         = { bg = bg_tab,      fg = "#db4b4b" },
    error_diagnostic_visible = { bg = bg_tab,      fg = "#db4b4b" },
    error_diagnostic_selected = { bg = bg_selected, fg = "#db4b4b", bold = true },

    indicator_selected       = { bg = bg_selected, fg = bg_selected },
    indicator_visible        = { bg = bg_tab,      fg = bg_tab },

    pick                     = { bg = bg_tab,      fg = "#db4b4b", bold = true, italic = false },
    pick_visible             = { bg = bg_tab,      fg = "#db4b4b", bold = true, italic = false },
    pick_selected            = { bg = bg_selected, fg = "#db4b4b", bold = true, italic = false },

    trunc_marker             = { bg = "NONE",      fg = bg_tab },
  },
})
