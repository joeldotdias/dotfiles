-- npm i -g @olrtg/emmet-language-server

---@type vim.lsp.Config
return {
    cmd = { "emmet-language-server", "--stdio" },
    filetypes = {
        "astro",
        "css",
        "html",
        "javascriptreact",
        "svelte",
        "templ",
        "typescriptreact",
        "vue",
    },
    root_markers = { ".git" },
}
