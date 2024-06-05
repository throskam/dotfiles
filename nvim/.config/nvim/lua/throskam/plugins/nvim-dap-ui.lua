-- DAP integration
return {
	"rcarriga/nvim-dap-ui",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 1,
						},
					},
					position = "bottom",
					size = 10,
				},
				{
					elements = {
						{
							id = "watches",
							size = 1,
						},
					},
					position = "bottom",
					size = 10,
				},
				{
					elements = {
						{
							id = "breakpoints",
							size = 1,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<Leader>dK", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "DAP UI eval" })

		vim.keymap.set("n", "<Leader>df", function()
			dapui.toggle(1)
		end, { desc = "DAP UI toggle scopes" })

		vim.keymap.set("n", "<Leader>dw", function()
			dapui.toggle(2)
		end, { desc = "DAP UI toggle watches" })

		vim.keymap.set("n", "<Leader>db", function()
			dapui.toggle(3)
		end, { desc = "DAP UI toggle breakpoints" })
	end,
}
