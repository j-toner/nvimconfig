vim.keymap.set("n", "<leader>os", ":ObsidianSearch <CR>", { desc = "[O]bsidian [S]earch" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew <CR>", { desc = "[O]bsidian [N]ew" }) --New Obsidian note
return {
    "obsidian-nvim/obsidian.nvim",

    ---@module 'obsidian'
    ---@type obsidian.config

    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "personal",
                    path = "~/ObsidianVault/nvim",
                },
                {
                    name = "work",
                    path = "~/ObsidianVault/work",
                },
            },
        })
    end,
}
