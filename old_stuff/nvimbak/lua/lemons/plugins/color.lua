return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                styles = {
                    comments = { italic = true },
                    sidebars = "transparent",
                },
                on_colors = function(colors)
                    colors.warning = "#FF5F1F"
                end,
                on_highlights = function(highlights, colors)
                    highlights.LineNr = {
                        fg = colors.cyan,
                    }
                    highlights.LineNrAbove = {
                        fg = colors.cyan,
                    }
                    highlights.LineNrBelow = {
                        fg = colors.cyan,
                    }
                    highlights.Directory = {
                        fg = "#ea9a97",
                    }
                end,
            })
            vim.cmd.colorscheme("tokyonight-storm")
        end,
    },

    {
        "brenoprata10/nvim-highlight-colors",
        event = { "BufWrite", "BufNewFile" },
        config = function()
            require("nvim-highlight-colors").setup({
                render = "virtual",
                enable_tailwind = true,
            })
        end,
    },
}
