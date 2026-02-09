-- Better syntax tree
return {
	"nvim-treesitter/nvim-treesitter",
	-- The new main branch as breaking changes
	branch = "master",
	-- DO NOT LAZY LOAD TREE SITTER
	-- https://github.com/nvim-treesitter/nvim-treesitter/issues/5896
	-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr() "
		vim.opt.foldenable = true
		vim.opt.foldlevel = 99
	end,
}
