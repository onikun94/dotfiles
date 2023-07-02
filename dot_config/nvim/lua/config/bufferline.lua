require("bufferline").setup {
  options = {
    --mode = "tabs",
    separator_style = 'slope',
    --always_show_bufferline = true,
    --show_buffer_close_icons = true,
    --show_close_icon = false,
    --color_icons = false
  },
  highlights = {
    separator = {
      --guifg = '#073642',
      --guibg = '#002b36',
      --fg = '#073642',
      --bg = '#002b36',
      --bg = '#1F2335',
    },
    separator_selected = {
      --bg = '#1F2335',
      --guifg = '#fff000',
      --guibg = '#fff000',
    },
    background = {
      bg = '#1F2335',
      --guifg = '#657b83',
      --guibg = '#002b36'
    },
    buffer_selected = {
      --guifg = '#fdf6e3',
      --gui = "bold",
      --bg = '#1F2335',
    },
    fill = {
      bg = '#1F2335',

    }
  },

}
