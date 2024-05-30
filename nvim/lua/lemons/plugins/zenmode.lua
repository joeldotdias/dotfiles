return {
    "folke/zen-mode.nvim",
    event = { "BufRead", "BufNewFile" },

    config = function()
        local zen_mode = require("zen-mode")

        vim.keymap.set("n", "<leader>zz", function()
            zen_mode.setup({
                window = {
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true,
                    },
                },

                ---@diagnostic disable-next-line: unused-local
                on_open = function(win)
                    ColorMyPencils("zen")
                end,

                ---@diagnostic disable-next-line: unused-local
                on_close = function(win)
                    ColorMyPencils()
                end,
            })
            zen_mode.toggle()
            vim.wo.wrap = false
        end)
    end,
}
