-- Remember last cursor position in buffers
return {
	"ethanholz/nvim-lastplace",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
}
