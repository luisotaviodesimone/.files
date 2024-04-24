local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  {
    install = {
      missing = true,
    },
    change_detection = {
      notify = false,
    },
  }
}

require("lazy").setup({
  {  import = "luisotaviodesimone.plugins"  },
  {  import = "luisotaviodesimone.plugins.lsp"  },
}, opts)
