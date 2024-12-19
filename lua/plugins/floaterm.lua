return {
'voldikss/vim-floaterm'
,
    config = function()
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 1
        vim.g.floaterm_wintitle = 0
        vim.g.floaterm_autoclose = 1
        vim.g.floaterm_opener = 'edit'
        vim.g.floaterm_shell = '/usr/bin/fish'
    end
}
