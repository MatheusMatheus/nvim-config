return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.code_actions.gitrebase,
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/google_checks.xml" },
				}),
				null_ls.builtins.formatting.astyle,

				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.refactoring,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
