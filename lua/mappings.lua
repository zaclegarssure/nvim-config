--------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
--------------------------------------------------------

local vim_map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

--Shortcut split navigation
vim_map('n', '<C-h>', '<C-w>h', {})
vim_map('n', '<C-j>', '<C-w>j', {})
vim_map('n', '<C-k>', '<C-w>k', {})
vim_map('n', '<C-l>', '<C-w>l', {})

--Add move line shortcuts
vim_map('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
vim_map('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
vim_map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim_map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
vim_map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim_map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- nvim-tree
vim_map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts) -- open/close
vim_map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts) -- refresh
vim_map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Telescope
local telescope = require('telescope.builtin')
map('n', '<leader><space>', telescope.buffers, default_opts)
map('n', '<leader>sf', function() telescope.find_files({ previewer = false }) end, default_opts)
map('n', '<leader>sb', telescope.current_buffer_fuzzy_find, default_opts)
map('n', '<leader>sh', telescope.help_tags, default_opts)
map('n', '<leader>st', telescope.tags, default_opts)
map('n', '<leader>sd', telescope.grep_string, default_opts)
map('n', '<leader>sp', telescope.live_grep, default_opts)
map('n', '<leader>so', function() telescope.tags({ only_current_buffer = true }) end, default_opts)
map('n', '<leader>?', telescope.oldfiles, default_opts)
