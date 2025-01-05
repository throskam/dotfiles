vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight when yanking (copying) text",
})

vim.api.nvim_create_user_command("JSON", [[<line1>,<line2>!jq]], { range = true, desc = "Format JSON" })

vim.api.nvim_create_user_command(
	"XML",
	[[<line1>,<line2>!python3 -c 'import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())']],
	{ range = true, desc = "Format XML" }
)

vim.api.nvim_create_user_command("RemoveWindowsEOL", [[%s/\r//g]], { desc = "Remove Windows-style line endings (\r)" })

vim.api.nvim_create_user_command(
	"RemoveTrailingSpaces",
	[[%s/\s\+$//e]],
	{ desc = "Remove trailing spaces from the entire file" }
)
