return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "rust",
                "go",
                "ocaml",
                "zig",
                "c",
                "lua",
                "bash",
                "templ",
                "typescript",
                "tsx",
                "jsdoc",
                "javascript",
                "python",
                "markdown",
                "vim",
                "vimdoc",
                "query",
                "sql",
                "yaml",
                "toml",
                "json",
            },

            sync_install = false,

            auto_install = true,

            indent = {
                enable = true,
            },

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        -- Sources lace grammar for tree-sitter
        require("lemons.lace")
    end,
}
