return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

--        vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
--        vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)

        vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
        vim.keymap.set("n", "<leader>hn", function() ui.nav_next() end)
        vim.keymap.set("n", "<leader>hp", function() ui.nav_prev() end)
        vim.keymap.set("n", "<leader>hm", function() ui.toggle_quick_menu() end)
    end,
}

