-- Configure LSP
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		-- Additional lua configuration.
		{ "folke/neodev.nvim", opts = {} },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Watch files for new types.
		capabilities.workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		}

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle Inlay Hints" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local bufnr = ev.buf

				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				nmap("<leader>rn", vim.lsp.buf.rename, "Rename variable under the cursor")
				nmap("<leader>ca", vim.lsp.buf.code_action, "Run code action")
				nmap("gd", vim.lsp.buf.definition, "Goto definition")
				nmap("gI", vim.lsp.buf.implementation, "Goto implementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Goto type definition")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace add folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace remove folder")
				nmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "Workspace list folders")
				nmap("<leader>gq", function()
					vim.lsp.buf.format({ async = false })
				end, "Format Buffer")
			end,
		})

		-- Configure lua-ls
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					hint = {
						enable = true,
						setType = false,
						paramType = true,
						paramName = true,
						semicolon = true,
						arrayIndex = true,
					},
				},
			},
		})

		-- Configure eslint.
		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		-- Configure Typescript
		lspconfig.tsserver.setup({
			init_options = {
				preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
				plugins = {
					{
						name = "@vue/typescript-plugin",
						-- Get the vue plugin installed by mason
						location = require("mason-registry").get_package("vue-language-server"):get_install_path()
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
			capabilities = capabilities,
		})

		-- Configure Vue
		lspconfig.volar.setup({
			on_attach = function(client)
				-- Avoid conflict with formatters.
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			capabilities = capabilities,
		})

		-- Configure Go
		lspconfig.gopls.setup({
			settings = {
				gopls = {
					analyses = {
						shadow = true,
						unusedvariable = true,
						unusedwrite = true,
						useany = true,
					},
					staticcheck = true,
					gofumpt = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
			capabilities = capabilities,
		})

		-- Configure HTML
		lspconfig.html.setup({
			filetypes = { "html", "templ" },
			capabilities = capabilities,
		})

		-- Configure HTMLX
		lspconfig.htmx.setup({
			filetypes = { "html", "templ" },
			capabilities = capabilities,
		})

		-- Configure Templ
		vim.filetype.add({ extension = { templ = "templ" } })
		lspconfig.templ.setup({
			filetypes = { "templ" },
			capabilities = capabilities,
		})
	end,
}
