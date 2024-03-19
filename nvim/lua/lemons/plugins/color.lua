function ColorMyPencils(mode)
    vim.cmd.colorscheme("rose-pine-moon")

    if mode ~= "zen" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,

    config = function()
        require("rose-pine").setup()
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
