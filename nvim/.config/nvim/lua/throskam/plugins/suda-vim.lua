-- Allow to read and write with sudo
return {
	"lambdalisue/suda.vim",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.g.suda_smart_edit = 1
	end,
}
