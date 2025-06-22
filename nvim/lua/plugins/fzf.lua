return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "FzfLua",
    keys = function()
        local fzf = require("fzf-lua")
        return {
            { "<leader>pf", fzf.files },
            { "<leader>of", fzf.oldfiles },
            { "<leader>pb", fzf.buffers },
            { "<leader>tj", fzf.help_tags },
            { "<leader>gw", fzf.grep_cword },
            { "<leader>lg", fzf.live_grep },

            {
                "<leader>fb",
                function()
                    fzf.blines({
                        winopts = {
                            height = 0.6,
                            width = 0.5,
                            preview = { vertical = "up:70%" },
                            -- Disable Treesitter highlighting for the matches.
                            treesitter = {
                                enabled = false,
                                fzf_colors = { ["fg"] = { "fg", "CursorLine" }, ["bg"] = { "bg", "Normal" } },
                            },
                        },
                        fzf_opts = {
                            ["--layout"] = "reverse",
                        },
                    })
                end,
                desc = "Buffer lines",
                mode = { "n", "x" },
            },
        }
    end,
    opts = {
        { "border-fused", "hide" },
        defaults = { git_icons = false },
        winopts = {
            preview = {
                scrollbar = false,
            },
        },
        fzf_opts = {
            ["--info"] = "default",
            ["--layout"] = "reverse-list",
        },
    },
}
