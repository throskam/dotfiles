-- Show terminal windows
return {
	enabled = false,
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local term = require("toggleterm")

		term.setup({
			open_mapping = "<leader>t",
			direction = "horizontal",
			insert_mappings = false,
		})

		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit TERMINAL mode" })
	end,
}
