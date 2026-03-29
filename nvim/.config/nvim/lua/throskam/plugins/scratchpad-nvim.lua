return {
	dir = "/home/throskam/Projects/scratchpad.nvim",
	keys = {
		{
			"<leader>pp",
			function()
				require("scratchpad").open()
			end,
			desc = "Open scratchpad",
		},
		{
			"<leader>pa",
			function()
				require("scratchpad").add()
			end,
			mode = { "n", "v" },
			desc = "Add scratchpad note",
		},
		{
			"<leader>ps",
			function()
				require("scratchpad").tmux_send()
			end,
			desc = "Send scratchpad to tmux pane",
		},
	},
	opts = {
		auto_clear = true,
	},
}
