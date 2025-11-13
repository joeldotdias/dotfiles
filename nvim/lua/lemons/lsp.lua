---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
    ---@param keymap string
    ---@param func function|string
    ---@param mode? string
    local lsp_key = function(keymap, func, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keymap, func, { buffer = bufnr })
    end

    local fzf = require("fzf-lua")

    lsp_key("K", function()
        vim.lsp.buf.hover({ border = "rounded" })
    end)

    lsp_key("gi", fzf.lsp_implementations)
    lsp_key("<leader>D", fzf.lsp_typedefs)
    lsp_key("<leader>ds", fzf.lsp_document_symbols)
    lsp_key("<leader>ws", fzf.lsp_live_workspace_symbols)
    lsp_key("<leader>ca", function()
        fzf.lsp_code_actions({ silent = true })
    end)
    lsp_key("<leader>br", fzf.lsp_references)
    lsp_key("<leader>rn", vim.lsp.buf.rename)
    lsp_key("<C-h>", vim.lsp.buf.signature_help, "i")

    if client:supports_method("textDocument/definition") then
        lsp_key("gd", fzf.lsp_definitions)
        lsp_key("gD", function()
            fzf.lsp_definitions({ jump1 = false })
        end)
    end

    vim.lsp.document_color.enable(true, bufnr, { style = "virtual" })
    if client:supports_method("textDocument/documentColor") then
        lsp_key("grc", vim.lsp.document_color.color_presentation)
    end
end

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        -- local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
        --     :map(function(file)
        --         return vim.fn.fnamemodify(file, ":t:r")
        --     end)
        --     :totable()
        -- vim.lsp.enable(server_configs)

        vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
        local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ":t:r")
            end)
            :totable()
        vim.lsp.enable(servers)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_keys", { clear = true }),
    desc = "LSP keymaps",
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
            return
        end

        on_attach(client, event.buf)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    float = function()
        return {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
        }
    end,
})
