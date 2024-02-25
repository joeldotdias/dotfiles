
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    desc = "Workaround for wsl clipboard non sense",
    pattern = '*',

    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual"
        })
        if vim.fn.has("wsl") == 1 then
            vim.fn.system("clip.exe", vim.fn.getreg('"'))
        end
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("RemoveSpaces", { clear = true }),
    desc = "Remove unnecessary whitespaces at EOLs",
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("EditText", { clear = true }),
	desc = "Enable spell check for some files",
    pattern = { "gitcommit", "markdown", "txt" },
    
    callback = function()
		vim.opt_local.spell = true
	end
})
