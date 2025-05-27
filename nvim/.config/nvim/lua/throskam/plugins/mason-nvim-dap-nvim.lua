-- Install DAP adapters.
return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
}
