-- Almost all the stuff here is from ThePrimeagen's neovim setup video

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- using comment.nvim instead coz it restores cursors position
-- comments
-- vim.keymap.set("n", "<leader>cc", "gcc", { remap = true })
-- vim.keymap.set("v", "cl", "gc", { remap = true })

-- move the entire selection vertically with auto indenting
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- preserve the cursor position while appending the next line
vim.keymap.set("n", "J", "mzJ`z")

-- center the cursor while doing half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center the cursor while walking through search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever --> preserve yanked/deleted content by deleting to void register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland --> yanking into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- replace word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a script into an executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- NEVER EVER going to Ex mode
-- "Its the worst place in the universe" - ThePrimeagen
vim.keymap.set("n", "Q", "<nop>")
