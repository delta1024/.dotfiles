local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
    ["<leader>a"] = { mark.add_file, "Add file to harpoon." },
    ["<C-e>"] = { ui.toggle_quick_menu, "Toggle harpoon menu." },
    ["<C-h>"] = { function()
        ui.nav_file(1)
    end, "Goto harpoon file one" },
    ["<C-t>"] = { function()
        ui.nav_file(2)
    end, "Goto harpoon file two" },
    ["<C-n>"] = { function()
        ui.nav_file(3)
    end, "Goto harpoon file three" },
    ["<C-s>"] = { function()
        ui.nav_file(4)
    end, "Goto harpoon file four" },
})
