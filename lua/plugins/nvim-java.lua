return {
	"nvim-java/nvim-java",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})
		require("lspconfig").jdtls.setup({
			capabilities = capabilities,
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
