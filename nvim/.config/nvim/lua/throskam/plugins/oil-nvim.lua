-- Manage files in a buffer
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return (name == "..")
				end,
			},
		})

		vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
	end,
}
