return {
    -- "brianhuster/live-preview.nvim",
    -- dependencies = {
    --     "ibhagwan/fzf-lua",
    -- },
    -- ft = "markdown",
    -- config = function()
    --     require("livepreview.config").set()
    -- end,
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
        require("lazy").load({ plugins = { "markdown-preview.nvim" } })
        vim.fn["mkdp#util#install"]()
    end,
}
