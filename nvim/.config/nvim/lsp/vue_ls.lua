return {
	on_attach = function(client)
		-- Avoid conflict with formatters.
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
