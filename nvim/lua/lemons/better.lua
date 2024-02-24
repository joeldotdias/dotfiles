
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),  
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40
        })
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("RemoveSpaces", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("EditText", { clear = true }),
	pattern = { "gitcommit", "markdown", "txt" },
    callback = function()
		vim.opt_local.spell = true
	end
})
