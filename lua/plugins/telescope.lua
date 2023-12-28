return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = require("telescope.actions").delete_buffer,
                    -- ['<C-d'] = false,
                },
            },
        },
        config = function()
            local builtin = require("telescope.builtin")
            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            -- See `:help telescope.builtin`
            vim.keymap.set(
                "n",
                "<leader>?",
                require("telescope.builtin").oldfiles,
                { desc = "[?] Find recently opened files" }
            )
            vim.keymap.set(
                "n",
                "<leader><space>",
                require("telescope.builtin").buffers,
                { desc = "[ ] Find existing buffers" }
            )
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
            vim.keymap.set(
                "n",
                "<leader>sw",
                require("telescope.builtin").grep_string,
                { desc = "[S]earch current [W]ord" }
            )
            vim.keymap.set(
                "n",
                "<leader>sd",
                require("telescope.builtin").diagnostics,
                { desc = "[S]earch [D]iagnostics" }
            )
            vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
            vim.keymap.set(
                "n",
                "<leader><space>",
                require("telescope.builtin").buffers,
                { desc = "[ ] Find existing buffers" }
            )
            -- require('telescope.actions').delete_buffer,
        end,
    },
    {

        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
