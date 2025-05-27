-- Install LSP servers.
return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
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
			"vue_ls",
		},
	},
}
