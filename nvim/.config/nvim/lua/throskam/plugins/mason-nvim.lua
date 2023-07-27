-- Ease LSP & co installation
return {
	"williamboman/mason.nvim",
	lazy = true,
	opts = {},
	build = function()
		vim.cmd("MasonUpdate")
	end,
}
