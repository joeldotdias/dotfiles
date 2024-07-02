return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    ft = { "javascript", "lua" },

    config = function()
        local neogen = require("neogen")

        local doc_cfg = function(convention)
            return {
                template = {
                    annotation_convention = convention,
                },
            }
        end

        local neogen_key = function(keymap, type)
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", keymap, function()
                neogen.generate({ type = type })
            end, opts)
        end

        neogen.setup({
            snippet_engine = "luasnip",
            languages = {
                lua = doc_cfg("emmylua"),
                javascript = doc_cfg("jsdoc"),
            },
        })

        neogen_key("<leader>nf", "func")
        neogen_key("<leader>nt", "type")
        neogen_key("<leader>nc", "class")
    end,
}
