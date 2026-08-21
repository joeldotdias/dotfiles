-- npm i -g vscode-langservers-extracted

---@type vim.lsp.Config
return {
    cmd = function(dispatchers, config)
        local cmd = "vscode-eslint-language-server"
        if (config or {}).root_dir then
            local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
            if vim.fn.executable(local_cmd) == 1 then
                cmd = local_cmd
            end
        end
        return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
    end,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs" },
    workspace_required = true,
    -- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
    settings = {
        validate = "on",
        packageManager = vim.NIL,
        useESLintClass = false,
        experimental = { useFlatConfig = false },
        codeActionOnSave = { enable = false, mode = "all" },
        format = false,
        quiet = false,
        onIgnoredFiles = "off",
        options = {},
        rulesCustomizations = {},
        run = "onType",
        problems = { shortenToSingleLine = false },
        -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
        -- This path is relative to the workspace folder (root dir) of the server instance.
        nodePath = "",
        workingDirectory = { mode = "location" },
        codeAction = {
            disableRuleComment = { enable = true, location = "separateLine" },
            showDocumentation = { enable = true },
        },
    },
    before_init = function(_, config)
        local root_dir = config.root_dir

        if root_dir then
            config.settings = config.settings or {}
            config.settings.workspaceFolder = {
                uri = root_dir,
                name = vim.fn.fnamemodify(root_dir, ":t"),
            }
        end
    end,
    handlers = {
        ["eslint/openDoc"] = function(_, params)
            vim.ui.open(params.url)
            return {}
        end,
        ["eslint/confirmESLintExecution"] = function(_, result)
            if not result then
                return
            end
            return 4 -- approved
        end,
        ["eslint/probeFailed"] = function()
            vim.notify("LSP[eslint]: Probe failed.", vim.log.levels.WARN)
            return {}
        end,
        ["eslint/noLibrary"] = function()
            vim.notify("LSP[eslint]: Unable to load ESLint library.", vim.log.levels.WARN)
            return {}
        end,
    },
}
