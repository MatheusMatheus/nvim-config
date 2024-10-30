return {
  "Tsuzat/NeoSolarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[ colorscheme NeoSolarized ]])
    require("NeoSolarized").setup({
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true },
      variables = {},
      string = { italic = true },
      underline = true,
      undercurl = true,
    })
    require("lualine").setup({
      options = {
        theme = "NeoSolarized",
      },
    })
  end,
}
