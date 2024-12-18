local options = {
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss { silent = true, pending = true }
            end,
            desc = "Dismiss All Notifications",
        },
    },
}
require("notify").setup {
    stages = "static",
    background_colour = "#000000",
    colour = "#FFFFFF",
    render = "wrapped-compact",
    style = "static",
    timeout = 3000,
    fps = 75,
    max_height = function()
        return math.floor(vim.o.lines * 0.75)
    end,
    on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
    init = function()
        -- when noice is not enabled, install notify on VeryLazy
    end,
}
