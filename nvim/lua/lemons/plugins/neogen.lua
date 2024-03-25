return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip"
    },
    event = "BufReadPost",

    config = function()
        local neogen = require("neogen")

        neogen.setup({
            snippet_engine = "luasnip",
            languages = {
                javascript = {
                    template = {
                        annotation_convention = "jsdoc"
                    }
                }
            }
        })

        vim.keymap.set("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end)

    end
}
