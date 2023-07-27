-- Add block lines
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "▏",
		},
		scope = {
			show_start = false,
			show_end = false,
		},
	},
}
