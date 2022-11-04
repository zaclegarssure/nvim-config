--------------------------------------------------------
-- Neovim settings
--------------------------------------------------------

--------------------------------------------------------
-- Neovim API aliases
--------------------------------------------------------
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

--------------------------------------------------------
-- General
--------------------------------------------------------
-- Leader
g.mapleader = ','
g.maplocalleader = ','
--Enable mouse mode
opt.mouse = 'a'
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard

--------------------------------------------------------
-- Tabs, indent
--------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.list = true
--Enable break indent
opt.breakindent = true


--------------------------------------------------------
-- Search
--------------------------------------------------------
--Set highlight on search
opt.hlsearch = false
--Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

--------------------------------------------------------
-- Neovim UI
--------------------------------------------------------
--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.termguicolors = true
--Map blankline
g.indent_blankline_char = '┊'
g.indent_blankline_filetype_exclude = { 'help', 'packer' }
g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
g.indent_blankline_char_highlight = 'LineNr'
g.indent_blankline_show_trailing_blankline_indent = false
opt.cursorline = true

--------------------------------------------------------
-- Memory, CPU
--------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

--Decrease update time
opt.updatetime = 250
vim.wo.signcolumn = 'yes'

--Save undo history
opt.undofile = true
