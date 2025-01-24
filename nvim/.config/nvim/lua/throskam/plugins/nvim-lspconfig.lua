-- Configure LSP
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Watch files for new types.
		capabilities.workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		}

		-- Configure lua-ls
		lspconfig.lua_ls.setup({
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					---@diagnostic disable-next-line: undefined-field
					if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
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
			capabilities,
		})

		-- Configure eslint.
		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		-- Configure Typescript
		lspconfig.ts_ls.setup({
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
			filetypes = { "html" },
			settings = {
				html = {
					format = {
						templating = true,
						wrapLineLength = 120,
						wrapAttributes = "auto",
					},
					hover = {
						documentation = true,
						references = true,
					},
				},
			},
			capabilities = capabilities,
		})

		-- Configure JSON
		lspconfig.jsonls.setup({
			filetypes = { "json" },
			capabilities = capabilities,
		})

		-- Configure Emmet
		lspconfig.emmet_language_server.setup({
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"typescriptreact",
			},
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
