-- Git integration
return {
	"NeogitOrg/neogit",
	keys = { "<leader>n" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({})

		vim.keymap.set("n", "<leader>n", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
	end,
}
