-- Coding agents wrapper
return {
	"folke/sidekick.nvim",
	opts = {
		nes = {
			enabled = false,
		},
		cli = {
			win = {
				layout = "float",
			},
			mux = {
				enabled = true,
				backend = "tmux",
			},
			picker = "telescope",
		},
	},
	keys = {
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
	},
}
