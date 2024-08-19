-- Indicate git changes in the sign column
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")

		gs.setup({
			current_line_blame = true,
			signs_staged_enable = true,
			on_attach = function(bufnr)
				local map = function(mode, keys, func, desc, expr)
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc, expr = expr or false })
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, "Next hunk", true)

				map("n", "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, "Previous hunk", true)

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer (hard)")
				map("n", "<leader>hU", gs.reset_buffer_index, "Unstage buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = false })
				end, "Blame line")
				map("n", "<leader>hB", function()
					gs.blame()
				end, "Blame line")
				map("n", "<leader>hd", gs.toggle_deleted, "Toggle deleted hunks")
				map("n", "<leader>hw", gs.toggle_word_diff, "Toggle word diff")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		})
	end,
}
