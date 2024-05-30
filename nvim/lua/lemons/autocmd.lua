-- Thank you incredibly nice people on r/neovim

local LemonBasket = vim.api.nvim_create_augroup("LemonBasket", { clear = true })
local HighlightYank = vim.api.nvim_create_augroup("HighlightYank", { clear = true })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = HighlightYank,
    desc = "Workaround for wsl clipboard non sense",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
        })
        if vim.fn.has("wsl") == 1 then
            vim.fn.system("clip.exe", vim.fn.getreg('"'))
        end
    end,
})

-- https://github.com/MariaSolOs/dotfiles/blob/fedora/.config/nvim/lua/autocmds.lua
vim.api.nvim_create_autocmd("BufReadPost", {
    group = LemonBasket,
    desc = "Go to the last location when opening a buffer",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = LemonBasket,
    desc = "Remove unnecessary whitespaces at EOLs",
    pattern = "*",
    callback = function()
        local view = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = LemonBasket,
    desc = "Enable spell check for some files",
    pattern = { "gitcommit", "markdown", "txt" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- https://github.com/I-Rakesh/nvim-conf/blob/master/lua/core/autocmd.lua
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = LemonBasket,
    desc = "Disable auto-commenting next line",
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = LemonBasket,
    desc = "Resize windows when terminal is resized",
    callback = function()
        local curr_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. curr_tab)
    end,
})
