return {
   "numToStr/Comment.nvim",
   
   config = function()
        require("Comment").setup ({
            toggler = {
                line = "<leader>cc",
                block = "<leader>bb"
            },

            extra = {
                above = "ccO",
                below = "cco",
                eol = "cca"
            },
            
            opleader = {
                line = "cl",
                block = "cb"
            },

            mappings= {
                basic = true,
                extra = true
            }
        })

        vim.keymap.set("n", "<leader>tcl", "<leader>gcc")
    end
}
