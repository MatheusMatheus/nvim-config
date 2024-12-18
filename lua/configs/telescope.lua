local options = {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
        },
    },
}

require("telescope").load_extension "ui-select"
