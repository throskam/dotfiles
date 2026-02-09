-- DAP integration
return {
	"mfussenegger/nvim-dap",
	keys = { "<leader>dc" },
	config = function()
		local dap = require("dap")

		dap.configurations.javascript = {
			{
				name = "Node Attach",
				type = "node2",
				request = "attach",
				address = "0.0.0.0",
				port = 9229,
				localRoot = "${workspaceFolder}",
				remoteRoot = "/workspace",
				restart = true,
			},
		}

		dap.adapters.go = {
			type = "server",
			port = 2345,
		}

		dap.configurations.go = {
			{
				name = "Go Remote Attach",
				type = "go",
				request = "attach",
				mode = "remote",
				substitutepath = { {
					from = "${workspaceFolder}",
					to = "/opt/app",
				} },
			},
		}

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
		vim.keymap.set("n", "<leader>dl", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<leader>dj", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
	end,
}
