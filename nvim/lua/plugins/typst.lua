return {
    "chomosuke/typst-preview.nvim",
    version = "1.*",
    ft = "typst",
    config = function()
        require("typst-preview").setup({
            dependencies_bin = {
                ["tinymist"] = vim.fn.exepath("tinymist"),
                ["websocat"] = vim.fn.exepath("websocat"),
            },
        })
    end,
}
