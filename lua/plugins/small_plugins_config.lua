--------------------------------------------------------
-- Other plugins configuration file, too small for a
-- unique file per plugin.
--------------------------------------------------------

-- Plugins: pears, gitsigns, vim-floaterm, bufferline, neoscroll, nvim-colorizer
-- https://github.com/steelsojka/pears.nvim
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/voldikss/vim-floaterm
-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/karb94/neoscroll.nvim
-- https://github.com/norcalli/nvim-colorizer.lua

-- Pears
require("pears").setup()

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add = { hl = 'GitGutterAdd', text = '+' },
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
    },
}

-- Floatterm
local g = vim.g
g.floaterm_keymap_new = '<leader>ft'
g.floaterm_keymap_toggle = '<leader>t'
g.floaterm_keymap_next = '<leader>fn'
g.floaterm_keymap_prev = '<leader>fp'
g.floaterm_keymap_kill = '<leader>fk'
g.floaterm_width = 0.9
g.floaterm_height = 0.9

-- tabline
require("bufferline").setup {}

-- natural scrolling
require('neoscroll').setup()

-- colorizer
require('colorizer').setup()

-- Zen mode
require('zen-mode').setup {
    backdrop = 1
}
