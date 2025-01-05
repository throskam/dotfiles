-- Git integration
return {
	"NeogitOrg/neogit",
	keys = { "<leader>gg", "<leader>gc" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({})

		vim.keymap.set("n", "<leader>gg", [[<cmd>Neogit kind=floating<cr>]], { desc = "Open Neogit" })
		vim.keymap.set("n", "<leader>gc", [[<cmd>NeogitLogCurrent kind=floating<cr>]], { desc = "Show current buffer commits" })
	end,
}
