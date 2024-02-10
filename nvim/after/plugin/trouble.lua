require("trouble").setup({
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
    use_diagnostic_signs = true,
})