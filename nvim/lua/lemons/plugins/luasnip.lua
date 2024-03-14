return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",

    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")
        local snippets = require("lemons.snippets")

        ls.filetype_extend("javascript", { "jsdoc" })

        ls.setup({
            history = false,
            updateevents = { "TextChanged", "TextChangedI" },
            enable_autosnippets = true,
            delete_check_events = { "InsertLeave" }
        })

        for i = 1, #snippets, 1 do
            lang, snips = snippets[i][1], snippets[i][2]
            ls.add_snippets(lang, snips)
        end


        local snip_modes = { "i", "s" }
        local opts = { silent = true }

        vim.keymap.set(snip_modes, "<C-e>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-p>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-n>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, opts)

        vim.keymap.set(snip_modes, "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, opts)

        -- quickly source snippets. Thanks TJ
        vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/lemons/plugins/luasnip.lua<CR>")
    end
}
