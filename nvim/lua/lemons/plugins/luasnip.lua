return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    event = "InsertEnter",

    config = function()
        local luasnip = require("luasnip")

        luasnip.filetype_extend("javascript", { "jsdoc" })

        luasnip.setup({
            history = false,
            updateevents = { "TextChanged", "TextChangedI" },
            enable_autosnippets = true,
            delete_check_events = { "InsertLeave" },
        })

        -- Add local snippets
        require("lemons.snippets")

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

        -- quickly source snippets. Thanks TJ
        vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/lemons/plugins/luasnip.lua<CR>")
    end,
}
