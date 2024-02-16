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
vim.opt.undodir = '~/.config/nvim/.undo//'
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})

-- Set swap directory
vim.opt.directory = '~/.config/nvim/.swap//'
vim.opt.swapfile = true

-- Set backup directory
vim.opt.backupdir = '~/.config/nvim/.backup//'
vim.opt.backup = true
