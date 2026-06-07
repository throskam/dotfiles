-- Snippets
return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	lazy = true,
	config = function(opts)
		require("luasnip.loaders.from_vscode").lazy_load(opts)
	end,
}
