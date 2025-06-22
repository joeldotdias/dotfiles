return {
    {
        "brianhuster/live-preview.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        ft = "markdown",
        config = function()
            require("livepreview.config").set()
        end,
    },
}
