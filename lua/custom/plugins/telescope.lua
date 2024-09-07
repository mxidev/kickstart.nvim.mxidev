return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },

    keys = {
      {
        ';f',
        function()
          local builtin = require 'telescope.builtin'
          builtin.find_files {
            hidden = true,
          }
        end,
        desc = 'Lists files in your current working directory, respects .gitignore',
      },
      {
        ';r',
        function()
          local builtin = require 'telescope.builtin'
          builtin.live_grep()
        end,
        desc = 'Search for a string in your current working directory and get results live as you type',
      },
      {
        '\\\\',
        function()
          local builtin = require 'telescope.builtin'
          builtin.buffers()
        end,
        desc = 'Lists open buffers',
      },
      {
        ';;',
        function()
          local builtin = require 'telescope.builtin'
          builtin.resume()
        end,
        desc = 'Resume the previous telescope picker',
      },
      {
        ';e',
        function()
          local builtin = require 'telescope.builtin'
          builtin.diagnostics()
        end,
        desc = 'Lists diagnostics for all open buffers or a specific one',
      },
      {
        ';s',
        function()
          local builtin = require 'telescope.builtin'
          builtin.treesitter()
        end,
        desc = 'Lists Function names, Variables, from treesitter',
      },
      {
        'sf',
        function()
          local telescope = require 'telescope'
          local function telescope_buffer_dir()
            return vim.fn.expand '%:p:h'
          end
          telescope.extensions.file_browser.file_browser {
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = 'normal',
            layout_config = { height = 40 },
          }
        end,
        desc = 'Open file browser with the path of the current buffer',
      },
    },

    config = function(_, opts)
      opts = opts or {}

      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local fb_actions = require('telescope').extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = 'horizontal',
        sorting_strategy = 'ascending',
        winblend = 0,
      })

      opts.pickers = {
        diagnostics = {
          theme = 'ivy',
          initial_mode = 'normal',
        },
      }

      opts.extensions = {
        file_browser = {
          mappings = {
            ['n'] = {
              ['N'] = fb_actions.create,
              ['h'] = fb_actions.goto_parent_dir,
              ['<C-u>'] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ['<C-d>'] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
            },
          },
        },
      }

      telescope.setup(opts)
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- -- See `:help telescope.builtin`
      -- local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      --
      -- -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })
      --
      -- -- It's also possible to pass additional configuration options.
      -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>s/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })
      --
      -- -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
