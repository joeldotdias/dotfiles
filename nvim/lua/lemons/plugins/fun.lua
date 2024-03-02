return {
    "ThePrimeagen/vim-be-good",

    {
        "ThePrimeagen/vim-apm",

        config = function()
            local apm = require("vim-apm")
            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
        end
    },
    
    {
        "eandrju/cellular-automaton.nvim",

        config = function ()
            vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
            vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>")
        end
    }
}
