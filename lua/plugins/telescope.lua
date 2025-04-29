local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
return {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Enable telescope fzf native, if installed
            pcall(telescope.load_extension, "fzf")

            -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            -- See `:help telescope.builtin`
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-q>"] = actions.delete_buffer
                        }
                    }
                }
            })
            vim.keymap.set(
                "n",
                "<leader>?",
                builtin.oldfiles,
                { desc = "[?] Find recently opened files" }
            )
            vim.keymap.set(
                "n",
                "<leader><space>",
                builtin.buffers,
                { desc = "[ ] Find existing buffers" }
            )
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(themes.get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
            -- vim.keymap.set("n", "<C-g>", actions.delete_buffer(buffnr), { desc = 'delete buffer' })
            vim.keymap.set(
                "n",
                "<leader>sw",
                builtin.grep_string,
                { desc = "[S]earch current [W]ord" }
            )
            vim.keymap.set(
                "n",
                "<leader>sd",
                builtin.diagnostics,
                { desc = "[S]earch [D]iagnostics" }
            )
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
            vim.keymap.set(
                "n",
                "<leader><space>",
                builtin.buffers,
                { desc = "[ ] Find existing buffers" }
            )
        end,
    },
    {

        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        themes.get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            --         -- To get ui-select loaded and working with telescope, you need to call
            --         -- load_extension, somewhere after setup function:
            telescope.load_extension("ui-select")
        end,
    },
}
