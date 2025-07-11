return {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    opts = {

        ensure_installed = {
            "rust",
            "go",
            "ocaml",
            "zig",
            "c",
            "lua",
            "bash",
            "templ",
            "zig",
            "gleam",
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
            "hyprlang",
            "toml",
            "yaml",
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
    },
}
