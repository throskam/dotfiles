return {
	init_options = {
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
			importModuleSpecifierPreference = "project-relative",
		},
		plugins = {
			{
				name = "@vue/typescript-plugin",
				-- Get the vue plugin installed by mason
				location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")
					.. "/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(client)
		-- Avoid conflict with formatters.
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
