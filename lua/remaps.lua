-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--change windows
vim.cmd([[nnoremap <Tab> <C-w>w]])

-- vim.keymap.set("i", "<C-e>", "<esc>") -- changed from network rw to Oil
-- vim.keymap.set("n", "<C-e>", "<esc>") -- changed from network rw to Oil
-- vim.keymap.set("v", "<C-e>", "<esc>") -- changed from network rw to Oil
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil) -- changed from network rw to Oil
-- vim.keymap.set("n", "<C-t>", vim.cmd.FloatermToggle) -- changed from network rw to Oil
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move selected u
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --move selected down
-- vim.keymap.set("n", "<C-d>", "<C-d>zz") --move down
-- vim.keymap.set("n", "<C-u>", "<C-u>zz") --move up
vim.keymap.set("n", "n", "nzzzv") -- center searched words
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y') --yank to clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>d", '"_d') --delete without saving deleted text to buffer
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-s>", ":w <CR>") --Save / write file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Center Cursor
vim.keymap.set('n', '<leader>cc', function() vim.opt.scrolloff = 999 - vim.o.scrolloff end)
print(os.clock() * 1000)
--tabnew
vim.keymap.set('n', '<C-t>', function() vim.cmd.tabnew() end) -- NEW TAB
vim.keymap.set('n', '<C-l>', function() vim.cmd.tabnext() end) -- NEXT TAB
vim.keymap.set('n', '<C-h>', function() vim.cmd.tabprev() end) --PREV TAB

vim.keymap.set("n", "<leader>db", ":bdelete <CR>") --delete buffer
-- vim.keymap.set('n', '<C-w>', function()  vim.cmd.tabclose() end)
-- vim.keymap.set("n", "<leader>no", string.format(':vsplit <bar> :new /home/jt/ObsidianVault/[os.clock() * 100000] <CR>')) --Save / write file

vim.keymap.set("n", "<leader>on", ':ObsidianNew <CR>') --New Obsidian note
vim.keymap.set("n", "<leader>os", ':ObsidianSearch <CR>') --Search Obsidian note

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
