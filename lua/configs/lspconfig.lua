local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "ols",
    "pyright",
    "ts_ls",
    "angularls",
    "eslint",
    "jsonls",
    "yamlls",
    "html",
    "cssls",
    "sqlls",
    "lemminx",
    "gopls",
}

-- list of servers configured with default config.
local default_servers = {
    "lua_ls",
    "ols",
    "pyright",
    "ts_ls",
    "angularls",
    "eslint",
    "jsonls",
    "yamlls",
    "html",
    "cssls",
    "sqlls",
    "lemminx",
    "gopls",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        },
    },
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                    vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

local install_path = vim.fn.stdpath "data"
    .. "/mason/packages/angular-language-server/node_modules"
-- local cwdpath = vim.fn.getcwd() .. "/node_modules"
local ang = install_path .. "/@angular/language-server/node_modules"

local cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    install_path,
    "--ngProbeLocations",
    ang,
}

lspconfig.angularls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = { "typescript", "html" },
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
}

lspconfig.ts_ls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
}