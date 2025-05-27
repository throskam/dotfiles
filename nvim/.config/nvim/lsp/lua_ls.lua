return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			---@diagnostic disable-next-line: undefined-field
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = true,
				semicolon = true,
				arrayIndex = true,
			},
		},
	},
}
