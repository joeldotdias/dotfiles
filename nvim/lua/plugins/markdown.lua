return {
    "brianhuster/live-preview.nvim",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    ft = "markdown",
    config = function()
        require("livepreview.config").set()
    end,
}
