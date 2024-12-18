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

    -- {
    --     "zbirenbaum/copilot.lua",
    --     event = "InsertEnter",
    --     config = function()
    --         require "configs.copilot"
    --     end,
    -- },
    --
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         {
    --             config = function()
    --                 require("copilot_cmp").setup()
    --             end,
    --         },
    --     },
    --     opts = {
    --         sources = {
    --             { name = "nvim_lsp", group_index = 2 },
    --             { name = "copilot", group_index = 2 },
    --             { name = "luasnip", group_index = 2 },
    --             { name = "buffer", group_index = 2 },
    --             { name = "nvim_lua", group_index = 2 },
    --             { name = "path", group_index = 2 },
    --         },
    --     },
    -- },
}
