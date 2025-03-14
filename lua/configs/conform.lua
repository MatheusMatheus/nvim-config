local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        javascript = { "pretierd", "pretier" },
        typescript = { "pretierd", "pretier" },
        java = { "google-java-format" },
    },

    formatters = {
        golines = {
            prepend_args = { "--max-len=80" },
        },
        -- Lua
        stylua = {
            prepend_args = {
                "--column-width",
                "80",
                "--line-endings",
                "Unix",
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
                "--quote-style",
                "AutoPreferDouble",
            },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
