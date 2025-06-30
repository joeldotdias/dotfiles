local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "BufReadPost" }, {
    group = augroup("pomodoro", { clear = true }),
    desc = "Pomodoro so I take breaks",
    once = true,
    callback = function()
        local timer = vim.loop.new_timer()
        if not timer then
            return
        end

        local seconds = 90 * 60

        timer:start(
            0,
            1000,
            vim.schedule_wrap(function()
                if seconds > 0 then
                    seconds = seconds - 1
                else
                    timer:stop()
                    vim.cmd("CellularAutomaton make_it_rain")
                end
            end)
        )
    end,
})

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/init.lua
autocmd({ "BufWritePre" }, {
    group = augroup("remove_ws", { clear = true }),
    desc = "Remove unnecessary whitespaces at EOLs",
    pattern = "*",
    callback = function()
        local view = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
})

-- https://github.com/MariaSolOs/dotfiles/blob/main/.config/nvim/lua/autocmds.lua
autocmd("BufReadPost", {
    group = augroup("last_loc", { clear = true }),
    desc = "Go to the last location when opening a buffer",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})

autocmd({ "FileType" }, {
    group = augroup("spell_check", { clear = true }),
    desc = "Enable spell check for some files",
    pattern = { "gitcommit", "markdown", "txt" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- https://github.com/I-Rakesh/nvim-conf/blob/master/lua/core/autocmd.lua
autocmd({ "BufEnter" }, {
    group = augroup("disable_newline_autocomment", { clear = true }),
    desc = "Disable auto-commenting next line",
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})
