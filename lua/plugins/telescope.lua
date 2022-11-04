--------------------------------------------------------
-- Telescope configuration file.
-- Mappings are defined in mappings.lua
--------------------------------------------------------

-- Plugin: telescope
-- https://github.com/nvim-telescope/telescope.nvim

--- Telescope
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}
