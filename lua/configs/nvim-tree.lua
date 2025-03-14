local function on_attach(bufnr)
    local api = require "nvim-tree-api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)
end

local options = {
    update_focused_file = {
        enable = true,
    },

    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
}

require("nvim-tree").setup(options)
