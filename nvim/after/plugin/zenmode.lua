local zen_mode = require("zen-mode")

vim.keymap.set("n", "<leader>zz", function()
    zen_mode.setup({
        window = {
            width = 90,
            options = {
                number = true,
                relativenumber = true,
            }
        }
    })
    zen_mode.toggle()
    vim.wo.wrap = false
    ColorMyPencils()
end)