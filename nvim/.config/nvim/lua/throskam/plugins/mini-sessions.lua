-- Session
return {
	"echasnovski/mini.sessions",
	config = function()
		local sessions = require("mini.sessions")

		sessions.setup()

		-- vim.keymap.set("n", "<leader>sc", '<Cmd>lua MiniSessions.write(vim.ui.input("Session Name > "))<CR>')
		vim.keymap.set("n", "<leader>sc", function()
			vim.ui.input({
				prompt = "Session name",
			}, function(input)
				if input == "" or input == nil then
					return
				end

				sessions.write(input)
			end)
		end, { desc = "Session create" })

		vim.keymap.set("n", "<leader>sd", function()
			sessions.select("delete", { force = true })
		end)

		vim.keymap.set("n", "<leader>sl", function()
			sessions.select()
		end, { desc = "Search sessions" })
	end,
}
