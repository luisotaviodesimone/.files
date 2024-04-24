return {
  {
    "binhtran432k/dracula.nvim",
    name = 'dracula',
    lazy = false,
    priority = 1000,
    config = function ()
      local dracula = require 'dracula'

      dracula.setup()

      vim.cmd.colorscheme 'dracula'
    end
  },
}
