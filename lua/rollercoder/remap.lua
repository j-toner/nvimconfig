vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move selected up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --move selected down
vim.keymap.set("n", "<C-d>", "<C-d>zz")--move down
vim.keymap.set("n", "<C-u>", "<C-u>zz")--move up
vim.keymap.set("n", "n", "nzzzv") -- center searched words
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")--yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")--delete without saving deleted text to buffer
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-s>", ":w <CR>")--Save / write file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
