-- Automatic DAP adapters installation
return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = { "node2" },
		handlers = {},
	},
}
