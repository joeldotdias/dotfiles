
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),  
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
	pattern = { "gitcommit", "markdown", "txt" },
    callback = function()
		vim.opt_local.spell = true
	end
})
