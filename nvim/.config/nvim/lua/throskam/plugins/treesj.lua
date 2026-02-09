-- Join and Split structures.
return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")

		treesj.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "<leader>J", treesj.toggle, { desc = "Toggle Split/Join" })
	end,
}
