-- Integrate DAP into Telescope
return {
	"nvim-telescope/telescope-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-telescope/telescope.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local telescope = require("telescope")

		telescope.load_extension("dap")

		local dap = telescope.extensions.dap

		vim.keymap.set("n", "<leader>dx", dap.commands, { desc = "Search DAP commands" })
		vim.keymap.set("n", "<leader>db", dap.list_breakpoints, { desc = "Search DAP breakpoints" })
		vim.keymap.set("n", "<leader>ds", dap.frames, { desc = "Search DAP frames" })
	end,
}
