-- pnpm install -g add yaml-language-server

---@type vim.lsp.Config
return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    settings = {
        yaml = {
            schemastore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
        },
    },
}
