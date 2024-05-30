return {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },

    config = function()
        require("Comment").setup({
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
