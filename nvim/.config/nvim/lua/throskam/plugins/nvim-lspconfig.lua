-- Configure LSP
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Watch files for new types.
		capabilities.workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		}

		vim.lsp.config("*", {
			capabilities,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local bufnr = ev.buf

				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				-- Improve default nvim mappings
				nmap("gd", vim.lsp.buf.definition, "Goto definition")

				-- LSP features
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				if client and client:supports_method("textDocument/formatting") then
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
						vim.lsp.buf.format({ bufnr = bufnr, async = false })
					end, {
						desc = "Format buffer",
					})
				end

				if client and client:supports_method("textDocument/inlayHint") then
					vim.api.nvim_buf_create_user_command(bufnr, "InlayHintsToggle", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
							{ bufnr = bufnr }
						)
					end, {
						desc = "Toggle inlay hints",
					})
				end

				-- Workspaces
				vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceAdd", function()
					vim.lsp.buf.add_workspace_folder()
				end, {
					desc = "Add workspace folder",
				})

				vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceRemove", function()
					vim.lsp.buf.remove_workspace_folder()
				end, {
					desc = "Remove workspace folder",
				})

				vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceList", function()
					vim.print(vim.lsp.buf.list_workspace_folders())
				end, {
					desc = "List workspace folders",
				})
			end,
		})
	end,
}
