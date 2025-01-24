-- Ensure LSP presence and help configure them
return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = true,
	opts = {
		ensure_installed = {
			"cssls",
			"emmet_language_server",
			"eslint",
			"gopls",
			"html",
			"jsonls",
			"lua_ls",
			"ts_ls",
			"volar",
		},
	},
}
