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
          theme = 'material-nvim', -- the default style
          section_separators = { left = '', right = '' },
          component_separators = { left = '>', right = '<', color = { gui = 'bold' } },
        },
        sections = {
          lualine_b = {
            { 'branch', icon = '' },
            {
              'diff',
              colored = true,
              diff_color = {
                added = { fg = '#04c904' },
                modified = { fg = '#f5bf0a' },
                removed = { fg = '#f51127' },
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
              style = '%d-%b %H:%M:%S',
              color = { fg = 'ffffff', gui = 'bold' },
            },
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#f77f36' },
            },
            { 'encoding', fmt = string.upper, color = { fg = '#fadf46', gui = 'bold' } },
            { 'fileformat', fmt = string.upper, icons_enabled = true, color = { fg = '#ffffff', gui = 'bold' } },
            {
              'filename',
              color = { fg = 'ffffff', gui = 'bold' },
            },
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              sections = { 'error', 'warn', 'info', 'hint' },
              diagnostics_color = {
                error = { fg = '#e60259' },
                warn = { fg = '#e67922' },
                info = { fg = '#eeff00' },
                hint = { fg = '#037bfc' },
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
