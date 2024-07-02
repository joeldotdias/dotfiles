return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = { "BufRead", "BufNewFile" },

    config = function()
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        -- local get_option = vim.filetype.get_option
        -- vim.filetype.get_option = function(filetype, option)
        --     return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
        --         or get_option(filetype, option)
        -- end

        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            toggler = {
                line = "<leader>cc",
                block = "<leader>bb",
            },

            extra = {
                above = "ccO",
                below = "cco",
                eol = "cca",
            },

            opleader = {
                line = "cl",
                block = "cb",
            },

            mappings = {
                basic = true,
                extra = true,
            },
        })
    end,
}
