--------------------------------------------------------
-- Saga specific configuration file, nothing for now.
-- Saga commands are set up in plugins/lsp.lua
--------------------------------------------------------

-- Plugin: lspsaga
-- https://github.com/tami5/lspsaga.nvim -- A fork fixing code action bug

local saga = require('lspsaga')
saga.init_lsp_saga()
