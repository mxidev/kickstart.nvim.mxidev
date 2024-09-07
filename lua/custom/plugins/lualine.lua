return {
  { -- Config Lualine
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      -- configure lualine with modified theme
      lualine.setup {
        options = {
          theme = 'sonokai', -- the default style
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          always_divide_middle = true,
        },
        extensions = {
          'lazy',
          'mason',
          'neo-tree',
          'toggleterm',
        },
        sections = {
          lualine_a = {
            {
              'mode',
              icons_enabled = true,
            },
          },
          lualine_b = {
            { 'branch', icon = '' },
            {
              'diff',
              colored = true,
              diff_color = {
                added = { fg = '#A9DC76' },
                modified = { fg = '#EDC763' },
                removed = { fg = '#FF6188' },
              },
              symbols = {
                added = ' ',
                modified = ' ',
                removed = ' ',
              },
            },
          },
          lualine_c = {
            {
              'datetime',
              style = '%H:%M',
              color = { fg = 'ffffff' },
            },
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#f58947' },
            },
            { 'encoding', fmt = string.upper, color = { fg = '#EDC763', gui = 'bold' } },
            -- { 'fileformat', fmt = string.upper, icons_enabled = true, color = { fg = '#ffffff', gui = 'bold' } },
            -- { 'filename', color = { fg = 'ffffff', gui = 'bold' } },
            { 'filetype', icon_only = true, color = { fg = '#ffffff', gui = 'bold' } },
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              sections = { 'error', 'warn', 'info', 'hint' },
              diagnostics_color = {
                error = { fg = '#ff386a' },
                warn = { fg = '#f0be3c' },
                info = { fg = '#a9dc25' },
                hint = { fg = '#318fe0' },
              },
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' ',
              },
            },
          },
        },
      }
    end,
  }, -- End Lualine
}
