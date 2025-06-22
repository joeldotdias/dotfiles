vim.filetype.add({
    extension = {
        lace = "lace",
    },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

---@diagnostic disable-next-line: inject-field
parser_config.lace = {
    install_info = {
        url = "~/projects/lace-lang/tree-sitter-lace",
        files = { "src/parser.c" },
    },
    filetype = "lace",
}
