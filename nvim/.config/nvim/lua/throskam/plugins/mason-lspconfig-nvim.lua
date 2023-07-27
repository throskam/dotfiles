-- Ensure LSP presence and help configure them
return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = true,
	opts = {
		ensure_installed = {
			"eslint",
			"gopls",
			"html",
			"htmx",
			"lua_ls",
			"templ",
			"tsserver",
			"volar",
		},
		-- TODO: this should work but it doesn't
		-- ensure_installed = nil,
		-- automatic_installation = true,
	},
}
