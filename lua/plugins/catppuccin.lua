return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                cmp = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" }
                    },
                },
            },
            -- This part forces the floating windows to have a background
            -- even if the rest of the editor is transparent
            custom_highlights = function(colors)
                return {
                    CmpPmenu = { bg = colors.crust },
                    CmpBorder = { fg = colors.blue },
                    CmpDocBorder = { fg = colors.blue },
                }
            end,
        })
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
    opts = {},
}
