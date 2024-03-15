function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,

    config = function()
        require("rose-pine").setup({
            disable_background = true
        })

        ColorMyPencils()
    end
    -- "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},

    -- config = function()
    --     require("tokyonight").setup({
    --         style = "moon"
    --     })
    --     vim.cmd[[colorscheme tokyonight]]
    -- end
}
