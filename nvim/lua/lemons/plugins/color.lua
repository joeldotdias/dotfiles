function ColorMyPencils(mode)
    vim.cmd.colorscheme("rose-pine-moon")

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
            require("rose-pine").setup({
                styles = {
                    bold = false
                }
            })
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
