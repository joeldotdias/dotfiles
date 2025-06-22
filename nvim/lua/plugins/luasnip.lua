return {
    "L3MON4D3/LuaSnip",
    config = function()
        local luasnip = require("luasnip")

        luasnip.setup({
            updateevents = { "TextChanged", "TextChangedI" },
            enable_autosnippets = true,
            delete_check_events = { "InsertLeave" },
        })

        local snip_modes = { "i", "s" }
        local opts = { silent = true }

        vim.keymap.set(snip_modes, "<C-e>", function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-p>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-n>", function()
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-l>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, opts)
    end,
}
