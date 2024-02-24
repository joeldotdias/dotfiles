return {
   "numToStr/Comment.nvim",
   
   config = function()
        require("Comment").setup ({
            opleader = {
                line = "cl",
                block = "cb"
            },

            mappings= {
                basic = true,
                extra = true
            }
        })
    end
}
