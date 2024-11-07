return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "deep",
			transparent = true,
			lualine = {
				transparent = true,
			},
			diagnostics = {
				darker = true,
				undercurl = true,
				background = true,
			},
		})
		require("onedark").load()
	end,
}
