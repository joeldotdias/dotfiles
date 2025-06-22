return {
    "folke/trouble.nvim",
    keys = {
        {
            "<leader>fk",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>bd",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "[B]uffer [D]iagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>lr",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>qf",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "[Q]uick[f]ix List (Trouble)",
        },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
}
