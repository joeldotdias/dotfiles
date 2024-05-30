-- return {
--     "folke/trouble.nvim",
--     branch = "dev", -- IMPORTANT!
--     keys = {
--         {
--             "<leader>fk",
--             "<cmd>Trouble diagnostics toggle<cr>",
--             desc = "Diagnostics (Trouble)",
--         },
--         {
--             "<leader>bd",
--             "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--             desc = "[B]uffer [D]iagnostics (Trouble)",
--         },
--         {
--             "<leader>cs",
--             "<cmd>Trouble symbols toggle focus=false<cr>",
--             desc = "Symbols (Trouble)",
--         },
--         {
--             "<leader>lr",
--             "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--             desc = "LSP Definitions / references / ... (Trouble)",
--         },
--         {
--             "<leader>xL",
--             "<cmd>Trouble loclist toggle<cr>",
--             desc = "Location List (Trouble)",
--         },
--         {
--             "<leader>qf",
--             "<cmd>Trouble qflist toggle<cr>",
--             desc = "[Q]uick[f]ix List (Trouble)",
--         },
--     },
--     opts = {}, -- for default options, refer to the configuration section for custom setup.
-- }
return {
    "folke/trouble.nvim",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
}

-- return {
--     "folke/trouble.nvim",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     event = "BufWinEnter",
--
--     config = function()
--         local trouble = require("trouble")
--
--         trouble.setup({
--             height = 6,
--             padding = false,
--             use_diagnostic_signs = true
--         })
--
--         vim.keymap.set("n", "<leader>fk", function() trouble.toggle() end)
--         vim.keymap.set("n", "<leader>wd", function() trouble.toggle("workspace_diagnostics") end)
--         vim.keymap.set("n", "<leader>dd", function() trouble.toggle("document_diagnostics") end)
--         vim.keymap.set("n", "<leader>qf", function() trouble.toggle("quickfix") end)
--         vim.keymap.set("n", "<leader>lr", function() trouble.toggle("lsp_references") end)
--
--         vim.keymap.set("n", "[t", function() trouble.next({ skip_groups = true, jump = true }) end)
--         vim.keymap.set("n", "]t", function() trouble.previous({ skip_groups = true, jump = true }) end)
--     end
-- }
