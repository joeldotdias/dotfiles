function ColorMyPencils(color, mode)
    color = color or "rose-pine-moon"

    vim.cmd.colorscheme(color)

    if mode ~= "zen" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,

        config = function()
            ---@diagnostic disable-next-line: missing-parameter
            require("rose-pine").setup()
            ColorMyPencils()
        end,
    },

    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({
                render = "virtual",
                enable_tailwind = true,
            })
        end,
    },
}
