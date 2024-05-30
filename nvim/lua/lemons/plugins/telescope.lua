return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",

            -- load fzf-native only if make is present
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                fzf = {},
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        vim.keymap.set("n", "<leader>pf", builtin.find_files)
        vim.keymap.set("n", "<leader>of", builtin.oldfiles)
        vim.keymap.set("n", "<leader>gf", builtin.git_files)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>tj", builtin.help_tags)
        vim.keymap.set("n", "<leader>km", builtin.keymaps)

        vim.keymap.set("n", "<leader>lg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set("n", "<leader>gw", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>cf", function()
            builtin.find_files({
                -- cwd = vim.fn.stdpath("config"),
                cwd = "$HOME/.dotfiles",
                -- show hidden files except .git while respecting .gitignore
                find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            })
        end)

        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end)
    end,
}
