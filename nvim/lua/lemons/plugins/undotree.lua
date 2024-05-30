return {
    "mbbill/undotree",
    event = { "BufReadPre", "BufWritePost" },

    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}
