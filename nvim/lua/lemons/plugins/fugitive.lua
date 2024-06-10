return {
    "tpope/vim-fugitive",
    cmd = "Git",

    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local opts = { remap = false }

        vim.keymap.set("n", "<leader>gc", ':Git commit -m "', opts)
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git("push")
        end, opts)
        vim.keymap.set("n", "<leader>po", ":Git push -u origin ", opts)
        vim.keymap.set("n", "<leader>gp", ":Git push -u origin HEAD<CR>", opts)
    end,
}
