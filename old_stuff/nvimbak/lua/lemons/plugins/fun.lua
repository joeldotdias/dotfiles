return {
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },

    {
        "eandrju/cellular-automaton.nvim",
        event = { "BufReadPost", "BufNewFile" },

        config = function()
            local cellular_automaton = require("cellular-automaton")

            cellular_automaton.register_animation({
                fps = 50,
                name = "slide",
                update = function(grid)
                    for i = 1, #grid do
                        local prev = grid[i][#grid[i]]
                        for j = 1, #grid[i] do
                            grid[i][j], prev = prev, grid[i][j]
                        end
                    end
                    return true
                end,
            })

            cellular_automaton.register_animation({
                fps = 30,
                name = "scramble",

                update = function(grid)
                    local function is_alphanumeric(c)
                        return c >= "a" and c <= "z" or c >= "A" and c <= "Z" or c >= "0" and c <= "9"
                    end

                    local scramble_word = function(word)
                        local chars = {}
                        while #word ~= 0 do
                            local index = math.random(1, #word)
                            table.insert(chars, word[index])
                            table.remove(word, index)
                        end
                        return chars
                    end
                    for i = 1, #grid do
                        local scrambled = {}
                        local word = {}
                        for j = 1, #grid[i] do
                            local c = grid[i][j]
                            if not is_alphanumeric(c.char) then
                                if #word ~= 0 then
                                    for _, d in pairs(scramble_word(word)) do
                                        table.insert(scrambled, d)
                                    end
                                    word = {}
                                end
                                table.insert(scrambled, c)
                            else
                                table.insert(word, c)
                            end
                        end

                        grid[i] = scrambled
                    end
                    return true
                end,
            })

            vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
            vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>")
            vim.keymap.set("n", "<leader>sc", "<cmd>CellularAutomaton scramble<CR>")
            vim.keymap.set("n", "<leader>sl", "<cmd>CellularAutomaton slide<CR>")
        end,
    },
    --
    {
        "tamton-aquib/duck.nvim",
        config = function()
            local duck = require("duck")

            vim.keymap.set("n", "<leader>dh", function()
                -- duck.hatch("🦀")
                for _ = 1, 7, 1 do
                    duck.hatch()
                end
            end, {})
            vim.keymap.set("n", "<leader>dk", function()
                duck.cook()
            end, {})
            vim.keymap.set("n", "<leader>da", function()
                duck.cook_all()
            end, {})
        end,
    },
    --
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     dependencies = {
    --         "MunifTanjim/nui.nvim"
    --     },

    --     config = function()
    --         require("noice").setup({
    --             messages = {
    --                 enabled = false
    --             },
    --             popupmenu = {
    --                 enabled = false
    --             },
    --             lsp = {
    --                 progress = {
    --                     false
    --                 }
    --             }
    --         })
    --     end
    -- }
}
