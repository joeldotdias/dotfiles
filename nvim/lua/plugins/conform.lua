return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                rust = { "rustfmt", lsp_format = "fallback" },
                go = { "gofmt" },
                c = { "clangd", lsp_format = "prefer" },
                lua = { "stylua" },
                javascript = { "oxfmt", "prettier", "biome", lsp_format = "fallback" },
                javascriptreact = { "oxfmt", "prettier", "biome", lsp_format = "fallback" },
                typescript = {
                    "oxfmt",
                    -- "prettier",
                    "biome",
                    lsp_format = "fallback",
                },
                typescriptreact = {
                    "oxfmt",
                    --[["prettier",]]
                    "biome",
                    lsp_format = "fallback",
                },
                astro = { "prettier", lsp_format = "fallback" },
                json = { "oxfmt", "prettier", "biome", lsp_format = "fallback" },
                jsonc = { "oxfmt", "prettier", "biome", lsp_format = "fallback" },
                html = { "oxfmt" },
                css = { "oxfmt" },
                markdown = { "oxfmt" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                sh = { "shfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
