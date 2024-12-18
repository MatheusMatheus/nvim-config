require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- nvim-tree
map("n", "<C-n>", ":NvimTreeFocus <CR>", {})
map("n", "<C-c>", ":NvimTreeCollapse<CR>", {})

-- LSP
map("n", "gD", vim.lsp.buf.definition, {})
map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>gd", vim.lsp.buf.declaration, {})
map("n", "<leader>gi", vim.lsp.buf.implementation, {})
map("n", "<C-k>", vim.lsp.buf.signature_help, {})
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {})
map("n", "<leader>D", vim.lsp.buf.type_definition, {})
map("n", "<leader>rn", vim.lsp.buf.rename, {})
map("n", "gr", vim.lsp.buf.references, {})

--nvim-java
-- Runnner
map("n", "<C-X>", ":JavaRunnerRunMain<CR>", {})
map("n", "<leader>sm", ":JavaRunnerStopMain<CR>", {})
map("n", "<C-L>", ":JavaRunnerToggleLogs<CR>", {})

--nvim-java
-- Refactor
map("n", "<leader>ct", ":JavaRefactorExtractConstant<CR>", {})
map("n", "<leader>mt", ":JavaRefactorExtractMethod<CR>", {})
