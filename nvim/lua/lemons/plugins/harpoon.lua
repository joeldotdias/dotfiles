return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "VimEnter" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>hp", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end)

        for i = 1, 5 do
            local navkey = string.format("<leader>%s", i)
            vim.keymap.set("n", navkey, function()
                harpoon:list():select(i)
            end)
        end
    end,
}
