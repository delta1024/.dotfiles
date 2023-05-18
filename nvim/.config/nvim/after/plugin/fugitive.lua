require('which-key').register({
    g = {
        name = "git",
        s = {"<cmd>Git<cr>", 'status'},
        l = {"<cmd>Git log<cr>", 'log'},
        p = {"<cmd>Git push<cr>", 'push'},
    }
}, {prefix = "<leader>"})
