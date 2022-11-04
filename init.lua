--[[
 __    __  ________   ______   __     __  ______  __       __
/  \  /  |/        | /      \ /  |   /  |/      |/  \     /  |
$$  \ $$ |$$$$$$$$/ /$$$$$$  |$$ |   $$ |$$$$$$/ $$  \   /$$ |
$$$  \$$ |$$ |__    $$ |  $$ |$$ |   $$ |  $$ |  $$$  \ /$$$ |
$$$$  $$ |$$    |   $$ |  $$ |$$  \ /$$/   $$ |  $$$$  /$$$$ |
$$ $$ $$ |$$$$$/    $$ |  $$ | $$  /$$/    $$ |  $$ $$ $$/$$ |
$$ |$$$$ |$$ |_____ $$ \__$$ |  $$ $$/    _$$ |_ $$ |$$$/ $$ |
$$ | $$$ |$$       |$$    $$/    $$$/    / $$   |$$ | $/  $$ |
$$/   $$/ $$$$$$$$/  $$$$$$/      $/     $$$$$$/ $$/      $$/

Neovim init file
Inspired by: https://github.com/brainfucksec/neovim-lua
--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('options')
require('mappings')
require('commands')
require('plugins/packer')
require('plugins/small_plugins_config')
require('plugins/colorscheme')
require('plugins/autocmp')
require('plugins/lsp')
require('plugins/treesitter')
require('plugins/nvim-tree')
require('plugins/lualine')
require('plugins/telescope')
require('plugins/saga')
require('plugins/dap')
