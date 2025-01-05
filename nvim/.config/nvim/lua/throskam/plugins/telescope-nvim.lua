-- Search anything and everything
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	event = { "VeryLazy" },
	config = function()
		local telescope = require("telescope")
		local config = require("telescope.config")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local lga_actions = require("telescope-live-grep-args.actions")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				live_grep_args = {
					mappings = {
						i = {
							["<C-y>"] = lga_actions.quote_prompt(),
							["<C-space>"] = actions.to_fuzzy_refine,
						},
					},
				},
			},
		})

		telescope.load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>fa", builtin.builtin, { desc = "Search Telescope built-in" })
		vim.keymap.set("n", "<leader>fp", builtin.find_files, { desc = "Search files" })
		vim.keymap.set(
			"n",
			"<leader>ff",
			telescope.extensions.live_grep_args.live_grep_args,
			{ desc = "Search by grep" }
		)
		vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "Search buffers" })
		vim.keymap.set("n", "<leader>f?", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search keymaps" })
		vim.keymap.set(
			"n",
			"<leader>f/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Search fuzzily in current buffer" }
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-in-telescope-mapping", {}),
			callback = function(ev)
				local bufnr = ev.buf

				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>fr", builtin.lsp_references, "Search LSP references")
				nmap("<leader>fd", builtin.diagnostics, "Search diagnostics")
				nmap("<leader>fbs", builtin.lsp_document_symbols, "Search buffer symbols")
				nmap("<leader>fws", builtin.lsp_dynamic_workspace_symbols, "Search workspace symbols")
			end,
		})
	end,
}
