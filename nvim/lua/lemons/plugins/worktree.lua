return {
    "ThePrimeagen/git-worktree.nvim",
    event = { "VimEnter" },

    config = function()
        require("git-worktree").setup()

        local telescope = require("telescope")
        telescope.load_extension("git_worktree")

        vim.keymap.set("n", "<leader>wt", function()
            telescope.extensions.git_worktree.git_worktrees()
        end, silent)
        vim.keymap.set("n", "<leader>cwt", function()
            telescope.extensions.git_worktree.create_git_worktree()
        end, silent)
    end,
}
