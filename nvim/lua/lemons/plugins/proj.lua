return {
    {
        "jsdoc-switch",
        dir = "~/projects/jsdoc-switch",
        -- "joeldotdias/jsdoc-switch.nvim",
        --
        ft = { "javascript", "javascriptreact" },
        --
        config = function()
            require("jsdoc-switch").setup({
                keys = {
                    checkEnd = "<leader>jsn",
                },
                -- auto_set_keys = false,
                -- notify = false
            })
            -- local switch = require('jsdoc-switch')
            -- vim.keymap.set('n', '<leader>jds', function()
            --     vim.cmd("JsdocSwitchStart")
            --     print("Well, hello JSDoc")
            -- end)
            -- vim.keymap.set('n', '<leader>jdt', '<cmd>JsdocSwitchToggle<CR>')
            -- vim.keymap.set('n', '<leader>jdn', ':JsdocSwitchStop<CR>')
            -- vim.keymap.set('n', '<leader>lhs', '<cmd>JsdocSwitchToggle<CR>')
            --     -- local switch = require('jsdoc-switch')
            --     -- vim.keymap.set('n', '<leader>jsh', function()
            --     --     switch.startJsdoc()
            --     --     print("Well, hello JSDoc")
            --     -- end)
            --     -- require("jsdoc-switch").setup()
            --
            --     -- local switch = require("jsdoc-switch")
            --     -- switch.setup({
            --     --     auto_set_keys = false
            --     -- })
            --     -- vim.keymap.set("n", "<leader>wwj", function() switch.toggle() end)
        end,
    },
}
