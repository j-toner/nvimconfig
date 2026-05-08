return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                "c",
                "cpp",
                "go",
                "lua",
                "python",
                "json",
                "css",
                "svelte",
                "rust",
                "tsx",
                "javascript",
                "typescript",
                "vimdoc",
                "vim",
                "bash",
                "http",
                "toml",
            },
            sync_install = false,
            ignore_install = { "phpdoc" },
            modules = {},
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
                        -- ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of assignment" }, this makes the cursor move forward
                        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of assignment" },
                    },
                },
            },
        })
    end,
}
