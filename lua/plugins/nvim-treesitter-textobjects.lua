return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
                    ["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
                    ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of assignment" },
                },
            },
        })
    end,
}
