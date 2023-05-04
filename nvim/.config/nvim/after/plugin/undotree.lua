require("which-key").register({
    u = {
        function ()
            vim.cmd.UndotreeToggle()
        end,
        "Undo Tree"
    },

}, { prefix = "<leader>" })
