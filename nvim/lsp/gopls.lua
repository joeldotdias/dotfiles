-- go install golang.org/x/tools/gopls@latest

---@type vim.lsp.Config
return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
}
