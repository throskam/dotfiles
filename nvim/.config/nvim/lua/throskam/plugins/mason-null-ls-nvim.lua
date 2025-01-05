-- Automatic non-LSP installation
return {
	enabled = false,
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = true,
	opts = {
		ensure_installed = {
			"stylua",
			"prettier",
		},
		-- TODO: this should work but it doesn't
		-- ensure_installed = nil,
		-- automatic_installation = true,
	},
}
