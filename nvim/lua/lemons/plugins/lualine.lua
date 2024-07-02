return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local colors, _ = require("tokyonight.colors").setup({
            style = "storm",
        })

        -- the only changes are in insert and command section
        local custom_tokyonight = {
            normal = {
                a = { bg = colors.blue, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.blue },
                c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
            },
            insert = {
                a = { bg = "#57e140", fg = colors.black },
                b = { bg = colors.fg_gutter, fg = "#08ff08" },
            },
            command = {
                a = { bg = "#f6a192", fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.yellow },
            },

            visual = {
                a = { bg = colors.magenta, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.magenta },
            },

            replace = {
                a = { bg = colors.red, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.red },
            },

            terminal = {
                a = { bg = colors.green1, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.green1 },
            },

            inactive = {
                a = { bg = colors.bg_statusline, fg = colors.blue },
                b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
                c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
            },
        }

        require("lualine").setup({
            options = {
                theme = custom_tokyonight,
            },
            sections = {
                lualine_a = {
                    { "mode", right_padding = 2 },
                },
                lualine_b = { "filename", "branch" },
                lualine_c = {},
                lualine_x = { "fileformat" },
                lualine_y = { "filetype", "progress" },
                lualine_z = {
                    { "location", left_padding = 2 },
                },
            },

            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },

            tabline = {},
            extensions = {},
        })
    end,
}
