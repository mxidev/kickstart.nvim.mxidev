return {
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   config = function()
  --     require('kanagawa').setup {
  --       compile = true,
  --       functionStyle = { bold = true },
  --       dimInactive = true,
  --     }
  --     vim.cmd 'colorscheme kanagawa-wave'
  --     -- vim.cmd("colorscheme kanagawa-dragon")
  --     -- vim.cmd("colorscheme kanagawa-lotus")
  --   end,
  --   override = function(colors)
  --     local theme = colors.theme
  --     return {
  --       NormalFloat = { bg = 'none' },
  --       FloatBorder = { bg = 'none' },
  --       FloatTitle = { bg = 'none' },
  --       NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
  --       LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --       MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --       Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
  --       PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
  --       PmenuSbar = { bg = theme.ui.bg_m1 },
  --       PmenuThumb = { bg = theme.ui.bg_p2 },
  --     }
  --   end,
  -- },

  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    local transparent = true

    local bg = '#011628'
    local bg_dark = '#011423'
    local bg_highlight = '#143652'
    local bg_search = '#0A64AC'
    local bg_visual = '#275378'
    local fg = '#CBE0F0'
    local fg_dark = '#B4D0E9'
    local fg_gutter = '#627E97'
    local border = '#547998'

    require('tokyonight').setup {
      style = 'night',
      transparent = transparent,
      styles = {
        sidebars = transparent and 'transparent' or 'dark',
        floats = transparent and 'transparent' or 'dark',
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    }

    vim.cmd 'colorscheme tokyonight'
  end,
}
