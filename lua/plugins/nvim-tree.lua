-----------------------------------------------------------
-- File manager configuration file
-- Mappings are defined in mappings.lua
-----------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

require('nvim-tree').setup {

    -- open the tree when running this setup function
    open_on_setup = true,
    view = { adaptive_size = true },
    diagnostics = {
        enable = false,
    },
    filters = {
        dotfiles = true,
        custom = {
            '.git'
        }
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        highlight_git = false,
        highlight_opened_files = "all",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true
            },
            glyphs = {
                default = '',
                symlink = '',
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌"
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                }
            }
        }
    },
    respect_buf_cwd = true
}
