-- Configure LSP
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
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

				-- Goto
				nmap("<leader>lgi", vim.lsp.buf.implementation, "Goto implementation")
				nmap("<leader>lgt", vim.lsp.buf.type_definition, "Goto type definition")
				nmap("<leader>lgd", vim.lsp.buf.declaration, "Goto declaration")

				-- LSP features
				nmap("<leader>lrn", vim.lsp.buf.rename, "Rename variable under the cursor")
				nmap("<leader>lca", vim.lsp.buf.code_action, "Run code action")
				nmap("<leader>lk", vim.lsp.buf.signature_help, "Signature documentation")
				nmap("<leader>lgq", function()
					vim.lsp.buf.format({ async = false })
				end, "Format Buffer")
				vim.keymap.set("n", "<leader>lih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { desc = "Toggle Inlay Hints" })

				-- Workspaces
				nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "Workspace add folder")
				nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "Workspace remove folder")
				nmap("<leader>lwl", function()
					vim.print(vim.lsp.buf.list_workspace_folders())
				end, "Workspace list folders")
			end,
		})
	end,
}
