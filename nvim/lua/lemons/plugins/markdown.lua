return {
    "iamcco/markdown-preview.nvim",

    cmd = {
        "MarkdownPreviewToggle",
        "MarkdownPreview",
        "MarkdownPreviewStop",
    },

    ft = { "markdown" },

    build = function()
        vim.fn["mkdp#util#install"]()
    end,

    config = function()
        vim.keymap.set("n", "<leader>mdp", "<cmd>MarkdownPreview<CR>")
        vim.keymap.set("n", "<leader>mdt", "<cmd>MarkdownPreviewToggle<CR>")
    end,
}
