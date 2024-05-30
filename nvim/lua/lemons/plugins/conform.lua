return {
    "stevearc/conform.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                rust = { "rustfmt" },
                go = { "gofmt" },
                ocaml = { "ocamlformat" },
                sh = { "shfmt" },
                lua = { "stylua" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                python = { "black" },
            },
        })

        -- vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        --     local curr_pos = vim.fn.winsaveview()
        --     conform.format({
        --         lsp_fallback = true,
        --         async = false,
        --         timeout_ms = 500,
        --     })
        --     vim.fn.winrestview(curr_pos)
        -- end)
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
                conform.format({
                    bufnr = args.buf,
                    lsp_fallback = true,
                    timeout_ms = 500,
                    quiet = true,
                })
            end,
        })
    end,
}
