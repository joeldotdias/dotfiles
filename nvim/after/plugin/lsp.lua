


local lsp = require("lsp-zero")

lsp.preset("recommended")

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { 
      "rust_analyzer", 
      "gopls", 
      "tsserver", 
      "pyright", 
      "clangd",
      "emmet_language_server",
      "tailwindcss"
  },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end
  },
})

local cmp = require('cmp')
local cmp_format = lsp.cmp_format()

cmp.setup({
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
  })
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


-- local lsp = require("lspconfig")

-- vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
-- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- vim.api.nvim_create_autocmd("LspAttach", {
--   desc = "LSP actions",
--   callback = function(event)
--     local opts = { buffer = event.buf }
--     vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--     vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     vim.keymap.set("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
--     vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--     vim.keymap.set("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--     vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--     vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--     vim.keymap.set({"n", "x"}, "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
--   end
-- })

-- require("mason").setup({})
-- require("mason-lspconfig").setup({
--   ensure_installed = {
--     "rust_analyzer", 
--     "gopls", 
--     "tsserver", 
--     "pyright", 
--     "clangd",
--     "emmet_language_server",
--     "tailwindcss",
--     "lua_ls"
--   }
-- })

-- lsp.rust_analyzer.setup({})
-- lsp.gopls.setup({})
-- lsp.tsserver.setup({})
-- lsp.pyright.setup({})
-- lsp.clangd.setup({})
-- lsp.emmet_language_server.setup({})
-- lsp.tailwindcss.setup({})
-- lsp.lua_ls.setup({})


-- local cmp = require("cmp")

-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body)
--     end,
--   },

--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },

--   mapping = cmp.mapping.preset.insert({
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<Tab>'] = nil,
--     ['<S-Tab>'] = nil
--   }),

--   sources = cmp.config.sources({
--     { name = "nvim_lsp" },
--     { name = "luasnip" }
--   })
-- })