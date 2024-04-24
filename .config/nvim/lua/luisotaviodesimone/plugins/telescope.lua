return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  defaults = {

  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files({
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--no-ignore-vcs",
          "-g",
          "!**/.git/*",
          "-g",
          "!**/node_modules/*",
          "-g", "!**/.repro/*",
        }
      })
    end)
    vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({
        search = vim.fn.input("Grep > "),
        additional_args = {
          "--hidden",
          '--glob',
          '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}',
        }
      })
    end)
  end,
}
