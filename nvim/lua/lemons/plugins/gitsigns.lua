return {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",

    config = function()
        require("gitsigns").setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' }
            },
            signcolumn = false,

            on_attach = function(bufnr)
                local gitsigns = package.loaded.gitsigns

                vim.keymap.set("n", "<leader>gt", gitsigns.toggle_signs, {})
                vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk, {})
                vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, {})
                vim.keymap.set("n", "<leader>gdf", gitsigns.diffthis, {})
            end
        }
    end
}
