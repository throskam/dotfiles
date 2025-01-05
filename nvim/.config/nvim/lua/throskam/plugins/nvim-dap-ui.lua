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

		dapui.setup()

		vim.keymap.set({ "n", "v" }, "<leader>de", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "DAP UI eval" })

		vim.keymap.set("n", "<leader>ds", function()
			dapui.float_element("scopes", { enter = true })
		end, { desc = "DAP UI scopes" })

		vim.keymap.set("n", "<leader>dw", function()
			dapui.float_element("watches", { enter = true })
		end, { desc = "DAP UI watches" })

		vim.keymap.set("n", "<leader>db", function()
			dapui.float_element("breakpoints", { enter = true })
		end, { desc = "DAP UI breakpoints" })

		vim.keymap.set("n", "<leader>df", function()
			dapui.float_element("frames", { enter = true })
		end, { desc = "DAP UI frames" })
	end,
}
