local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<A-s>', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', '<A-d>', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<C-a>', 'gg<S-v>G')

-- Resize windows with arrows
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right', ':vertical resize +2<CR>', opts)

-- Indent config
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move selection
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)
map('v', 'p', '"_dP', opts)

-- Visual block mapping
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Lazy keymaps
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy UI' })

-- buffers
map('n', '<leader>bb', '<cmd>e #<CR>', { desc = 'Switch to Other Buffer' })
-- map('n', '<leader>`', '<cmd>e #<CR>', { desc = 'Switch to Other Buffer' })
map('n', '<A-c>', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })
map('n', '<A-,>', '<cmd>bprev<CR>', { desc = 'Previous Buffer' })
map('n', '<A-.>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })

-- ToggleTerm
map('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' })

-- Oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- New file
-- map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })
-- Fast saving from all modes
-- map('n', '<Leader>w', '<cmd>write<CR>', { desc = 'Save File' })

-- Compiler
-- Open compiler options
map('n', '<F6>', '<cmd>CompilerOpen<cr>', opts)
-- Redo last selected option. Optional keymap
-- map('n', '<S-F6>', '<cmd>CompilerStop<cr>' .. '<cmd>CompilerRedo<cr>', opts)
-- Toggle compiler results
map('n', '<F8>', '<cmd>CompilerToggleResults<cr>', opts)
