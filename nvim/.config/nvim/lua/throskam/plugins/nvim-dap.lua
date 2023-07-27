-- DAP integration
return {
	"mfussenegger/nvim-dap",
	lazy = true,
	config = function()
		local dap = require("dap")
		local widgets = require("dap.ui.widgets")

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
		vim.keymap.set("n", "<leader>dl", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<leader>dj", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<Leader>dd", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
		vim.keymap.set({ "n", "v" }, "<Leader>dK", widgets.hover, { desc = "DAP open floating information message" })

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("dap-close-mapping", {}),
			pattern = "dap-float",
			callback = function(args)
				vim.keymap.set("n", "q", "<C-w>c", { buffer = args.buf })
			end,
		})

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
