return {
    "nvim-pack/nvim-spectre",
    
    config = function()
        local spectre = require("spectre")
        
        spectre.setup({
            result_padding = '',
            default = {
                replace = {
                    cmd = "sed"
                }
            }
        })

        vim.keymap.set("n", "<leader>S", function() spectre.toggle() end, {
            desc = "Toggle Spectre"
        })
        vim.keymap.set("n", "<leader>sw", function() spectre.open_visual({ select_word=true }) end, {
            desc = "Search current word"
        })
        vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set("n", "<leader>sp", function() spectre.open_file_search({ select_word=true }) end, {
            desc = "Search on current file"
        })
    end
}
