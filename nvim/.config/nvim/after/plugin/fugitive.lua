require('which-key').register({
    g = {
        name = "git",
        s = {"<cmd>Git<cr>", 'git status'},
    }
}, {prefix = "<leader>"})
