return {
    "ThePrimeagen/vim-be-good",

    {
        "eandrju/cellular-automaton.nvim",

        config = function ()
            vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
            vim.keymap.set("n", "<leader>gf", "<cmd>CellularAutomaton game_of_life<CR>")
        end
    }
}
