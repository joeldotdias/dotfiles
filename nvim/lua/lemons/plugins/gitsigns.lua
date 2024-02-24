return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require("gitsigns").setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            signcolumn = false,
            
            on_attach = function(bufnr)
                vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_signs<CR>", {})
                vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
                vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
            end
        }
    end
}
