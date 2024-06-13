return {

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers',
          style_preset = bufferline.style_preset.default,
          themable = true,
          numbers = 'ordinal',
          close_command = 'bdelete! %d',
          right_mouse_command = 'bdelete! %d',
          left_mouse_command = 'buffer %d',
          middle_mouse_command = nil,
          indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'underline',
          },
          buffer_close_icon = 'X',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = 'nvim_lsp',
          diagnostics_update_in_insert = false,
          offsets = {
            { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center', separator = true },
          },
          color_icons = true,
          separator_style = 'slope',
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_close_icon = true,
          show_buffer_close_icons = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
          duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
          auto_toggle_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },
          sort_by = 'insert_at_end',
        },
      }
    end,
  },
}
