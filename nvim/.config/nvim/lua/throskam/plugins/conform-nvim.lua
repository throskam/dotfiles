-- Simulate non-LSP as LSP
return {
	"stevearc/conform.nvim",
	dependencies = {
		"zapling/mason-conform.nvim",
	},
	ft = { "lua", "javascript", "mdformat" },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				markdown = { "mdformat" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "first",
			},
		})

		require("mason-conform").setup()
	end,
}
