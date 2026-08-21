-- npm i -D -E @biomejs/biome

---@type vim.lsp.Config
return {
    cmd = function(dispatchers, config)
        local cmd = "biome"
        if (config or {}).root_dir then
            local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)

            if vim.fn.executable(local_cmd) == 1 then
                cmd = local_cmd
            end
        end

        return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
    end,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "biome.json", "biome.jsonc" },
    workspace_required = true,
}
