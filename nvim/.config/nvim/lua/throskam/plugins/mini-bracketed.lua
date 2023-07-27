-- Bracket mappings
return {
	"echasnovski/mini.bracketed",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.bracketed").setup()

		-- Remap [ and ] to é and è respectively for azerty keyboard
		vim.keymap.set("n", "é", "[", { remap = true })
		vim.keymap.set("n", "è", "]", { remap = true })
		vim.keymap.set("o", "é", "[", { remap = true })
		vim.keymap.set("o", "è", "]", { remap = true })
		vim.keymap.set("x", "é", "[", { remap = true })
		vim.keymap.set("x", "è", "]", { remap = true })
		vim.keymap.set("n", "éé", "[[", { remap = true })
		vim.keymap.set("n", "èè", "]]", { remap = true })
		vim.keymap.set("o", "éé", "[[", { remap = true })
		vim.keymap.set("o", "èè", "]]", { remap = true })
		vim.keymap.set("x", "éé", "[[", { remap = true })
		vim.keymap.set("x", "èè", "]]", { remap = true })
	end,
}
