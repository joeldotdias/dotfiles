-- npm i -g @vtsls/language-server

local jsts_settings = {
    suggest = { completeFunctionCalls = true },
    inlayHints = {
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        variableTypes = { enabled = true },
    },
}

---@type vim.lsp.Config
return {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
    settings = {
        typescript = jsts_settings,
        javascript = jsts_settings,
        vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
                maxInlayHintLength = 30,
                completion = {
                    enableServerSideFuzzyMatch = true,
                },
            },
        },
    },
}
