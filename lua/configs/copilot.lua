local options = {
    suggestions = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
            accept = false,
            next = "<M-]>",
            prev = "<M-[>",
        },
    },
    panel = { enabled = false },
    filetypes = {
        markdown = true,
        help = true,
    },
}

require("copilot").setup(options)
