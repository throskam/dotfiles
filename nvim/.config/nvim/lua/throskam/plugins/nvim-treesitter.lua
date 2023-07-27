-- Better syntax tree
return {
	"nvim-treesitter/nvim-treesitter",
	-- DO NOT LAZY LOAD TREE SITTER
	-- https://github.com/nvim-treesitter/nvim-treesitter/issues/5896
	-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
	build = ":TSUpdate",
	config = function()
		-- TODO: check this https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L314
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"css",
				"html",
				"javascript",
				"lua",
				"scss",
				"templ",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
			},
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
