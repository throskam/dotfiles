-- Theme catppuccin
return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
		})
	end,
}
