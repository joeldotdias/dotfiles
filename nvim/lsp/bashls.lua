-- npm i -g bash-language-server
-- pacman -S shellcheck
-- pacman -S shfmt

---@type vim.lsp.Config
return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh", "zsh" },
}
