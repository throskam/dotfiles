-- Theme Material
return {
	"marko-cerovac/material.nvim",
	lazy = true,
	config = function()
		local material = require("material")

		material.setup({
			plugins = {
				"gitsigns",
				"nvim-cmp",
				"nvim-web-devicons",
				"telescope",
			},
		})

		vim.g.material_style = "deep ocean"
	end,
}
