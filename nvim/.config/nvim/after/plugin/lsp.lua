local lsp = require('lsp-zero')
local wk = require('which-key')

lsp.preset('recommended')
lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    wk.register({
            K = { function() vim.lsp.buf.hover() end, "Tool tip" },
            ['gd'] = { function() vim.lsp.buf.definition() end, "Goto definition" },
            ['[d'] = { function() vim.diagnostic.goto_next() end, "Goto next diagnostic" },
            [']d'] = { function() vim.diagnostic.goto_prev() end, "Goto prev diagnositc" },
            ["<leader>"] = {
                t = { "<cmd>silent !alacritty&<cr>", "Open terminal"},
                F = { "<cmd>LspZeroFormat<cr>", "Format workspace" },
                v = {
                    name = "variables",
                    s = { function() vim.lsp.buf.workspace_symbol() end, "Search symbol" },
                    d = { function() vim.diagnostic.open_float() end, "Open diagnostic popup" },
                    a = { function() vim.lsp.buf.code_action() end, "Code action" },
                    r = { function() vim.lsp.buf.rename() end, "Rename variable" },
                    f = { function() vim.lsp.buf.references() end, "Find varaible references" },
                }
            },
        },
        opts)
end)

lsp.setup()
