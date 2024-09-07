return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 10,
        open_mapping = [[<c-t>]],
        hide_numbers = false,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
        direction = 'float',
        auto_scroll = true,
        highlights = {
          FloatBorder = {
            guifb = '#4c7fa1',
          },
        },
        float_opts = {
          border = 'curved',
          title_pos = 'center',
          height = 25,
          width = 105,
        },
        winbar = {
          enabled = true,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
      }
    end,
  },
}
