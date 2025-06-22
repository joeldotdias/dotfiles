return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                rust = { "rustfmt", lsp_format = "fallback" },
                go = { "gofmt" },
                c = { "clangd", lsp_format = "prefer" },
                lua = { "stylua" },
                javascript = { "prettier", lsp_format = "fallback" },
                javascriptreact = { "prettier", lsp_format = "fallback" },
                json = { "prettier", lsp_format = "fallback" },
                jsonc = { "prettier", lsp_format = "fallback" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                sh = { "shfmt" },
            },
        })

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
