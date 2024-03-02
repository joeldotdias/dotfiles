return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim"
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
