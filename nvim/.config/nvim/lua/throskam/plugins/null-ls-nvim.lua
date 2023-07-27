-- Simulate non-LSP as LSP
return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
			on_attach = function(client, bufnr)
				local function is_null_ls_formatting_enabled()
					local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
					local generators = require("null-ls.generators").get_available(
						file_type,
						require("null-ls.methods").internal.FORMATTING
					)
					return #generators > 0
				end

				if client.server_capabilities.documentFormattingProvider then
					if client.name == "null-ls" and is_null_ls_formatting_enabled() or client.name ~= "null-ls" then
						vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
					else
						vim.bo[bufnr].formatexpr = nil
					end
				end

				-- if client.supports_method("textDocument/formatting") then
				-- 	local augroup = vim.api.nvim_create_augroup("lsp-formatting", {})
				--
				-- 	-- Format on save
				-- 	vim.api.nvim_create_autocmd("BufWritePre", {
				-- 		group = augroup,
				-- 		buffer = bufnr,
				-- 		callback = function()
				-- 			vim.lsp.buf.format({ async = false })
				-- 		end,
				-- 	})
				-- end
			end,
		})
	end,
}
