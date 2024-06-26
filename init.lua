-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--neovide only

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_transparency = 0.8
    vim.cmd "cd ~/progRock"   -- starts in ~/progRock
end

vim.opt.scroll = 5

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
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

require("vim-options")
require("remaps")
require("lazy").setup("plugins")

-- vim.cmd.colorscheme("carbonfox")
