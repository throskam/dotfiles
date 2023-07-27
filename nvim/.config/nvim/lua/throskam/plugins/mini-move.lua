-- Text move
return {
	"echasnovski/mini.move",
	event = "InsertEnter",
	opts = {
		mappings = {
			-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
			left = "<C-x>h",
			right = "<C-x>l",
			down = "<C-x>j",
			up = "<C-x>k",

			-- Move current line in Normal mode
			line_left = "<C-x>h",
			line_right = "<C-x>l",
			line_down = "<C-x>j",
			line_up = "<C-x>k",
		},
	},
}
