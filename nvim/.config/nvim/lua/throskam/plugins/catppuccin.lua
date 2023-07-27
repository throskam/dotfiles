-- Theme catppuccin
return {
	"catppuccin/nvim",
	lazy = true,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
		})
	end,
}
