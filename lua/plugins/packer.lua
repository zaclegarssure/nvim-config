-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- Install packer if not present
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Compile plugins when this file is modified
vim.api.nvim_exec(
    [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
    false
)

-- Plugins
return require('packer').startup(function(use)
    -- Lua lib
    use 'nvim-lua/plenary.nvim'
    use 'wbthomason/packer.nvim' -- Package manager
    -- UI to select things (files, grep results, open buffers...)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires =  { 'nvim-lua/plenary.nvim'  }
    }
    use 'joshdick/onedark.vim' -- Theme inspired by Atom
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Collection of configurations for built-in LSP client
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }
    -- Auto completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Nice UI for LSP
    use 'tami5/lspsaga.nvim'
    -- Snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    -- Status Line
    use 'nvim-lualine/lualine.nvim'
    -- File explorer
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    -- Better Rust LSP
    use 'simrat39/rust-tools.nvim'
    -- Autopairs
    use 'windwp/nvim-autopairs'
    -- Surround things easily
    use "tpope/vim-surround"
    -- Floating terminal
    use 'voldikss/vim-floaterm'
    -- Debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'theHamsta/nvim-dap-virtual-text', requires = { "mfussenegger/nvim-dap" } }
    -- OwO tabline
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    -- LSP progress on status line
    use 'arkav/lualine-lsp-progress'
    -- Scala LSP
    use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }
    -- Color viewer
    use 'norcalli/nvim-colorizer.lua'
    -- Java LSP
    use 'mfussenegger/nvim-jdtls'
    use {
        'abecodes/tabout.nvim'
    }
end)
