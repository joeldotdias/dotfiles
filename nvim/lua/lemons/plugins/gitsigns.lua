return {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },

    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            signcolumn = false,

            on_attach = function(bufnr)
                local gs_map = function(keymap, fn, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set("n", keymap, fn, opts)
                end

                gs_map("<leader>gt", gitsigns.toggle_signs)
                gs_map("<leader>gh", gitsigns.preview_hunk)
                gs_map("<leader>gb", gitsigns.toggle_current_line_blame)
                gs_map("<leader>gdf", gitsigns.diffthis)
            end,
        })
    end,
}
