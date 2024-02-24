return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>tj', '<cmd>AdvancedGitSearch<CR>')
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
        
        vim.keymap.set('n', '<leader>lg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        
        vim.keymap.set('n', '<leader>lgw', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
    end
}
