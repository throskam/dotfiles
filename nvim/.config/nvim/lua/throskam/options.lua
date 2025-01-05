vim.opt.guicursor = ""

-- Add mac EOL
vim.opt.fileformats:append({ "mac" })

-- Indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Invisible chars
vim.opt.listchars:append({ eol = "¬", tab = ">.", trail = "~", precedes = "<", space = "␣", nbsp = "+" })

-- Avoid breaking the line at the last character, but rather at a 'breakat' character
vim.opt.linebreak = true

-- Set relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Add left and right to wrap direction.
vim.opt.whichwrap:append({
	["<"] = true,
	[">"] = true,
	h = true,
	l = true,
})

-- Use smart case during search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use already open buffer and tabs in quickfix
vim.opt.switchbuf:append({ "useopen", "usetab" })

-- Ignore files in auto-complete
vim.opt.wildignore:append({ "**/.git" })
vim.opt.wildignore:append({ "**/node_modules" })

-- Disable backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Minimum number of line above and below cursor
vim.opt.scrolloff = 7

-- Set the leqder to ","
vim.g.mapleader = ","
