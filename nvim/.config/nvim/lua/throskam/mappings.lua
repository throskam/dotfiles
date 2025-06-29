vim.keymap.set("n", "<leader>,", [[:w<cr>]], { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>.", [[:noh<cr>]], { silent = true, desc = "Remove search highlights" })
vim.keymap.set("n", "<leader>x", [[:bd<cr>]], { silent = true, desc = "Buffer delete" })
vim.keymap.set("n", "<leader>X", [[:bd<cr>]], { silent = true, desc = "Force buffer delete" })
vim.keymap.set("n", "<leader>c", [[:close<cr>]], { silent = true, desc = "Close" })
vim.keymap.set("n", "<leader>q", [[:q<cr>]], { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>Q", [[:q!<cr>]], { silent = true, desc = "Force quit" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "<leader><", function()
	vim.lsp.buf.document_highlight()
end, { silent = true, desc = "Show search highlights" })

vim.keymap.set("n", "<leader>>", function()
	vim.lsp.buf.clear_references()
end, { silent = true, desc = "Clear search highlights" })
