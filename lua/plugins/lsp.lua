--------------------------------------------------------
-- LSP servers configuration file + saga bindings
--------------------------------------------------------

-- Plugins: nvim-lspconfig, lspsaga, rust-tools, nvim-metals
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/tami5/lspsaga.nvim -- A fork fixing code action bug
-- https://github.com/simrat39/rust-tools.nvim
-- https://github.com/scalameta/nvim-metals
-- LSP setting
local nvim_lsp = require('lspconfig')
local api = vim.api

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>fr', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Rust server
require('rust-tools').setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
}

local home = os.getenv("HOME")

-- Kotlin server
nvim_lsp.kotlin_language_server.setup {
    cmd = { home .. '/.local/share/kotlin-language-server/server/build/install/server/bin/kotlin-language-server' },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Lua server
local sumneko_root_path = '/usr/lib/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- Scala Metals
vim.opt_global.shortmess:remove("F")
local metals_config = require("metals").bare_config()

metals_config.capabilities = capabilities
metals_config.on_attach = on_attach
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
    showImplicitArguments = true,
}

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})


-- Java JDTLS
local workspace_dir = home .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local jar_patterns = {
    '/.local/share/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
}
local bundles = {}
for _, jar_pattern in ipairs(jar_patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
        if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
            table.insert(bundles, bundle)
        end
    end
end

local jdtls_config = {
    cmd = {
        "java-lsp.sh",
        workspace_dir,
    },
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)


        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
        --require('jdtls.dap').setup_dap_main_class_configs()
    end,
    capabilities = capabilities,
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    init_options = {
        bundles = bundles;
        extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities;
    }
}
-- Autocmd that will actually be in charging of starting the whole thing
local nvim_jdtls_group = api.nvim_create_augroup("nvim-jdtls", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    callback = function()
        require("jdtls").start_or_attach(jdtls_config)
    end,
    group = nvim_jdtls_group,
})
