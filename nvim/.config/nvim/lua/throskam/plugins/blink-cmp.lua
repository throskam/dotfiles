-- Completion
return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
		"L3MON4D3/LuaSnip",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "markdown" },
			providers = {
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
			},
		},
		cmdline = {
			completion = {
				menu = { auto_show = true },
			},
		},
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
	},
}
