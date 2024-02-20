vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

-- Disable mouse
vim.opt.mouse = ""

-- Set tabspaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Set persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = os.getenv("HOME") .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})

-- Set swap directory
vim.opt.directory = os.getenv("HOME") .. "/.vim/swapdir"
vim.opt.swapfile = true

-- Set backup directory
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/.backup"
vim.opt.backup = true
