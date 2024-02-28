return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local trouble = require("trouble")

        trouble.setup({
            auto_fold = false,
            fold_open = " ",
            fold_closed = " ",
            height = 6,
            indent_str = " ┊   ",
            include_declaration = {
                "lsp_references",
                "lsp_implementations",
                "lsp_definitions"
            },
            multiline = true,
            padding = false,
            position = "bottom",
            severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
            use_diagnostic_signs = true
        })

        vim.keymap.set("n", "<leader>fk", function() trouble.toggle() end)
        vim.keymap.set("n", "<leader>wd", function() trouble.toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>dd", function() trouble.toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>qf", function() trouble.toggle("quickfix") end)
        vim.keymap.set("n", "<leader>lr", function() require("trouble").toggle("lsp_references") end)

        vim.keymap.set("n", "[t", function() trouble.next({ skip_groups = true, jump = true }) end)
        vim.keymap.set("n", "]t", function() trouble.previous({ skip_groups = true, jump = true }) end)
    end
}
