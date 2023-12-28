require("rollercoder.remap")
require("rollercoder.set")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    --list troubles with code
    -- git gutter
    -- { "tpope/vim-fugitive" }, replaced with lazy git

    -- Useful plugin to show you pending keybinds.
    -- "gc" to comment visual regions/lines
    -- visually select then press s<char> or press sa{motion}{char}
    -- { 'kyazdani42/nvim-web-devicons' },
    -- { "tpope/vim-vinegar" },

})
