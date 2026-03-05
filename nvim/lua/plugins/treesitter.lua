return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local ts = require("nvim-treesitter")

        local parsers = {
            "c",
            "rust",
            "go",
            "ocaml",
            "bash",
            "typescript",
            "javascript",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "hyprlang",
            "sql",
            "toml",
            "yaml",
            "json",
            "python",
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local buf, filetype = args.buf, args.match

                local language = vim.treesitter.language.get_lang(filetype)
                if not language then
                    return
                end

                if not vim.treesitter.language.add(language) then
                    return
                end

                vim.treesitter.start(buf, language)

                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
