-- DAP integration
return {
	"mfussenegger/nvim-dap",
	lazy = true,
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
		vim.keymap.set("n", "<leader>dl", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<leader>dj", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })

		dap.configurations.javascript = {
			{
				name = "Node Attach",
				type = "node2",
				request = "attach",
				address = "localhost",
				port = 9229,
				localRoot = "${workspaceFolder}",
				remoteRoot = "/home/node/app",
				restart = true,
			},
		}
	end,
}
