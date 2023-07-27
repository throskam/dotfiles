-- Theme Material
return {
	"marko-cerovac/material.nvim",
	lazy = true,
	config = function()
		local material = require("material")
		local functions = require("material.functions")

		material.setup({
			plugins = {
				"gitsigns",
				"nvim-cmp",
				"nvim-web-devicons",
				"telescope",
			},
		})

		vim.g.material_style = "deep ocean"
		vim.keymap.set("n", "<leader>ms", functions.find_style, { desc = "Search material style" })
	end,
}
