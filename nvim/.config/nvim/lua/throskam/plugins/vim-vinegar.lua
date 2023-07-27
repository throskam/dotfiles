-- Improve netrw
return {
	enabled = false,
	"tpope/vim-vinegar",
	config = function()
		vim.g.netrw_fastbrowse = 0
	end,
}
