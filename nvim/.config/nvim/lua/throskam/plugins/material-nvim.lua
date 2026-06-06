-- Theme Material
return {
	"marko-cerovac/material.nvim",
	priority = 1000,
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
