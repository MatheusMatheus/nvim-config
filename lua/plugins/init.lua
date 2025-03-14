return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.treesitter"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require "configs.mason-lspconfig"
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        after = "nvim-lspconfig",
        config = function()
            require "configs.lint"
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require "configs.mason-lint"
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require "configs.conform"
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require "configs.mason-conform"
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        version = "*",
        config = function()
            require "configs.nvim-tree"
        end,
    },

    {
        "nvim-java/nvim-java",
        lazy = false,
        dependencies = {
            "nvim-java/lua-async-await",
            "nvim-java/nvim-java-core",
            "nvim-java/nvim-java-test",
            "nvim-java/nvim-java-dap",
            "MunifTanjim/nui.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            {
                "williamboman/mason.nvim",
                opts = {
                    registries = {
                        "github:nvim-java/mason-registry",
                        "github:mason-org/mason-registry",
                    },
                },
            },
        },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.nvim-java"
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require "configs.noice"
            require "configs.notify"
        end,
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        after = "nvim-lspconfig",
    },

    ["nvim-telescope/telescope.nvim"] = {
        module = "telescope",
        override_options = function()
            return {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                },
                extensions_list = { "themes", "terms", "ui-select" },
            }
        end,
    },

    {
        "luckasRanarison/tailwind-tools.nvim",
        event = "VeryLazy",
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "mlaursen/vim-react-snippets",
        },
        --@param opts cmp.ConfigSchema
        opts = function()
            vim.api.nvim_set_hl(
                0,
                "CmpGhostText",
                { link = "Comment", default = true }
            )
            require("vim-react-snippets").lazy_load()
            -- local cmp = require "cmp"
            local luasnip = require "luasnip"
            luasnip.filetype_extend("typescriptreact", { "html" })
            luasnip.filetype_extend("javascriptreact", { "html" })
            require("luasnip/loaders/from_vscode").lazy_load()
        end,
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
    },
}
