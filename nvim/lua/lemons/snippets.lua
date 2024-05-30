local luasnip = require("luasnip")

local snip_dir = "lua/lemons/snippets/"
local conf_dir = vim.fn.stdpath("config")
local snip_ext = ".lua"

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file(snip_dir .. "*" .. snip_ext, true)) do
    local lang = ft_path:match(conf_dir .. "/" .. snip_dir .. "(%a+)" .. snip_ext)
    local snippets = require("lemons.snippets." .. lang)
    luasnip.add_snippets(lang, snippets)
end
