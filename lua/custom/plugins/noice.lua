return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = function(_, opts)
      opts = opts or {}
      table.insert(opts.routes or {}, {
        filter = {
          event = 'notify',
          find = 'No information available.',
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd('FocusLost', {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes or {}, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = 'notify_send',
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = 'split',
          opts = { enter = true, format = 'details' },
          format = {},
        },
      }
    end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 5000,
      render = 'wrapped-compact',
    },
  },
}
