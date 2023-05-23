local builtin = require('telescope.builtin')
local wk = require("which-key")
wk.register({
    f = {
        f = {
            function()
                builtin.find_files()
            end,
            "Find Files" },
            S = {
                function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end,
                "Search Files"
            },
    },
}, { prefix = "<leader>" })
vim.keymap.set('n', "<C-p>", builtin.git_files)
