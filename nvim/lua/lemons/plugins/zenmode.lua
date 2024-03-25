return {
    "folke/zen-mode.nvim",
    event = "VeryLazy",

    config = function()
        local zen_mode = require("zen-mode")

        vim.keymap.set("n", "<leader>zz", function()
            zen_mode.setup({
                window = {
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true
                    }
                },

                on_open = function (win)
                    ColorMyPencils("zen")
                end,

                on_close = function (win)
                   ColorMyPencils()
                end
            })
            zen_mode.toggle()
            vim.wo.wrap = false
            -- ColorMyPencils("zen")
        end)
    end
}
