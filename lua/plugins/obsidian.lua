vim.keymap.set("n", "<leader>os", ":ObsidianSearch <CR>", {desc = "[O]bsidian [S]earch"})
vim.keymap.set("n", "<leader>on", ':ObsidianNew <CR>', {desc = "[O]bsidian [N]ew"})    --New Obsidian note
-- vim.keymap.set("n", "<leader>os", ':ObsidianSearch <CR>') --Search Obsidian note
return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp", -- see below for full list of optional dependencies 👇
    },
    config = {
        workspaces = {
            {
                name = "main",
                path = "~/ObsidianVault/nvim",
                strict = true
            },
            {
                name = "codes",
                path = "~/progRock/notes/stuff",
                strict = true
            }
        },

        -- see below for full list of options 👇
    },
}
