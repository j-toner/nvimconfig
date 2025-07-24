-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.opt.guicursor = "i:ver30-iCursor-blinkon1"
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

vim.opt.wrap = true

--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.colorcolumn = "150"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"
-- diagnostic info
-- vim.diagnostic.config({ virtual_lines = new_config })

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = { current_line = true } })
end, { desc = 'Toggle diagnostic virtual_lines' })


--vim.apm.nvim_create_autocmd('LspAttach', {
--    callback = function (ev)
--        local client = vim.lsp.get_client_by_id(ev.data.client_id)
--        if client:supports_method("textDocument/completion") then
--            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--        end
--    end,
--})
