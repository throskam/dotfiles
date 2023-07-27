vim.g.mapleader = ","

vim.keymap.set("n", "<leader>w", ":w!<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", { desc = "cd $PWD" })
vim.keymap.set("n", "<leader>,", ":noh<cr>", { desc = "Remove search highlights" })
vim.keymap.set(
	"n",
	"<leader><cr>",
	[[mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm]],
	{ silent = true, desc = "Replace Windows new lines by UNIX new lines" }
)
vim.keymap.set("n", "<leader><space>", [[:%s/\s\+$//e<cr>]], { silent = true, desc = "Remove trailing space" })
