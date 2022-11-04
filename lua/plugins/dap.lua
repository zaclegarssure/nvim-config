--------------------------------------------------------
-- DAP (Debug adapter tool) configuration file
--------------------------------------------------------

-- Plugins: nvim-dap, nvim-dapui
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = "lldb"
}

dap.configurations.java = {
    {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote";
        hostName = "127.0.0.1";
        port = 5005;
    },
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()


local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local dapui = require('dapui')

map('n', '<F5>', dap.continue, default_opts)
map('n', '<F10>', dap.step_over, default_opts)
map('n', '<F11>', dap.step_into, default_opts)
map('n', '<F12>', dap.step_out, default_opts)
map('n', '<leader>b', dap.toggle_breakpoint, default_opts)
map('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, default_opts)
map('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, default_opts)
map('n', '<leader>dr', dap.repl.open, default_opts)
map('n', '<leader>dl', dap.run_last, default_opts)
map('n', '<leader>dui', dapui.toggle, default_opts)
