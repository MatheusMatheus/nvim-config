return {
	"nvim-java/nvim-java",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})
		require("lspconfig").jdtls.setup({
			servers = {
				jdtls = {
					settings = {
						java = {
							configuration = {
								runtimes = {
									{
										name = "JavaSE-23",
										path = "/home/matheus_lindo/work/devtools/jdklink",
										default = true,
									},
								},
							},
						},
					},
				},
			},
		})
	end,
}
