-- Overwrite vimsui.select and vim.ui.input with prettier alternative
return {
	"stevearc/dressing.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("dressing").setup({
			input = {
				relative = "editor",
			},
			select = {
				telescope = require("telescope.themes").get_ivy(),
			},
		})
	end,
}
