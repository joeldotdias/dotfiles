return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable "make" == 1
            end
        },
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        }
    },

    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown()
                }
            }
        })
        telescope.load_extension("ui-select")
        telescope.load_extension("fzf")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
        vim.keymap.set("n", "<leader>tj", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>km", builtin.keymaps, {})

        vim.keymap.set("n", "<leader>lg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set("n", "<leader>gw", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>cf", function()
            builtin.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)

    end
}
