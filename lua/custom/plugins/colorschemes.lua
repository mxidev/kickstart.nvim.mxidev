return {
  'marko-cerovac/material.nvim',
  priority = 1000,
  config = function()
    require('material').setup {

      contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        cursor_line = true, -- Enable darker background for the cursor line
        floating_windows = false,
      },

      styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        -- strings = { bold = true },
        variables = { bold = true },
      },

      plugins = { -- Uncomment the plugins that you use to highlight them
        -- "coc",
        -- "colorful-winsep",
        -- "dap",
        'dashboard',
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        'gitsigns',
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        -- "indent-blankline",
        -- "lspsaga",
        'mini',
        -- "neogit",
        -- "neotest",
        -- "neo-tree",
        -- "neorg",
        -- "noice",
        'nvim-cmp',
        -- "nvim-navic",
        'nvim-tree',
        'nvim-web-devicons',
        -- "rainbow-delimiters",
        -- "sneak",
        'telescope',
        -- "trouble",
        'which-key',
        -- "nvim-notify",
      },

      high_visibility = {
        darker = true,
      },
      lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    }
    vim.cmd 'colorscheme material-deep-ocean'
  end,
}
