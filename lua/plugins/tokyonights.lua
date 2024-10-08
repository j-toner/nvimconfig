return {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            transparent = true,
            style = 'night',
        })
        -- vim.cmd.colorscheme("tokyonight-night")
    end,
    opts = {},
    transparent = true,
}
