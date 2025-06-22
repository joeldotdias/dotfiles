-- This is not an AI plugin
return {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
        require("mini.ai").setup({
            search_method = "cover",
            mappings = {
                -- Disable next/last variants.
                around_next = "",
                inside_next = "",
                around_last = "",
                inside_last = "",
            },
        })
    end,
}
