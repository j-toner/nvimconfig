-- local on_attach = function(_, bufnr)
--     -- In this case, we create a function that lets us more easily define mappings specific
--     -- for LSP related items. It sets the mode, buffer and description for us each time.
--     local nmap = function(keys, func, desc)
--         if desc then
--             desc = "LSP: " .. desc
--         end
--
--         vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
--     end
--
--     -- nmap("<C-g>", require("telescope.actions").delete_buffer(bufnr), "delete")
--     nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
--     nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
--     nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
--     nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
--     nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
--     nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
--     nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
--     nmap("K", vim.lsp.buf.hover, "Hover Documentation")
--     nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
--     -- Lesser used LSP functionality
--     nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--     nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
--     nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
--     nmap("<leader>wl", function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, "[W]orkspace [L]ist Folders")
--
--     vim.keymap.set("n", "<C-f>", function()
--         vim.lsp.buf.format({ async = true })
--     end)
--     -- vim.cmd([[au BufWritePre * lua vim.lsp.buf.format({ async = false })]])
-- end
--
-- local servers = {
--     tsserver = { filetypes = { "javascript", "typescript" } },
--     tailwindcss = { filetypes = { "javascript", "typescript", "svelte" } },
--     html = { filetypes = { "html", "twig", "hbs" } },
--     svelte = { filetypes = { "svelte" } },
--     lua_ls = {
--         Lua = {
--             workspace = { checkThirdParty = false },
--             telemetry = { enable = false },
--         },
--     },
-- }

return {

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<C-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "tsserver" },
                },
            })
        end
    },
    {"hrsh7th/cmp-nvim-lsp",},
    { url = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "svelte" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
            -- { 'saghen/blink.cmp' },
        },
        --     local configs = require("lspconfig/configs")
        config = function()
            local lspconfig = require("lspconfig")
            -- local capabilities = require('blink.cmp').get_lsp_capabilities()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.svelte.setup({
                capabilities = capabilities
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                -- root_dir = function(fname)
                --     return require('lspconfig.util').root_pattern(
                --         'tailwind.config.js',
                --         'tailwind.config.cjs',
                --         'tailwind.config.mjs',
                --         'tailwind.config.ts', -- if you also use TypeScript config files
                --         'package.json',
                --         'node_modules',
                --         '.git'
                --     )(fname) or vim.loop.os_homedir()
                -- end,

            })
            -- lspconfig.html.setup({
            --     capabilities = capabilities
            -- })
            -- lspconfig.lua_ls.setup({
            --     capabilities = capabilities
            -- })
            -- lspconfig.tsserver.setup({
            --     capabilities = capabilities
            -- })
        end,
        --     lspconfig.rust_analyzer.setup({
        --         on_attach = function(client, bufnr)
        --             vim.lsp.inlay_hint.enable(bufnr)
        --         end,
        --         settings = {
        --             ["rust-analyzer"] = {
        --                 imports = {
        --                     granularity = {
        --                         group = "module",
        --                     },
        --                     prefix = "self",
        --                 },
        --                 cargo = {
        --                     buildScripts = {
        --                         enable = true,
        --                     },
        --                 },
        --                 procMacro = {
        --                     enable = true,
        --                 },
        --                 diagnostics = {
        --                     enable = false,
        --                 },
        --             },
        --         },
        --     })
        --
        --     if not configs.golangcilsp then
        --         configs.golangcilsp = {
        --             default_config = {
        --                 cmd = { "golangci-lint-langserver" },
        --                 root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
        --                 init_options = {
        --                     command = {
        --                         "golangci-lint",
        --                         "run",
        --                         "--enable-all",
        --                         "--disable",
        --                         "lll",
        --                         "--out-format",
        --                         "json",
        --                         "--issues-exit-code=1",
        --                     },
        --                 },
        --             },
        --         }
        --     end
        --     lspconfig.golangci_lint_ls.setup({
        --         filetypes = { "go", "gomod" },
        --     })
        -- end,
    }
}
-- mason_lspconfig.setup_handlers({
--     function(server_name)
--         require("lspconfig")[server_name].setup({
--             settings = servers[server_name],
--             attach = on_attach(),
--             capabilities = capabilities,
--             filetypes = (servers[server_name] or {}).filetypes,
--         })
--     end,
-- })
--
--
--


-- opts = {
--     servers = {
--         tsserver = { filetypes = { "javascript", "typescript" } },
--         tailwindcss = { filetypes = { "javascript", "typescript", "svelte" } },
--         html = { filetypes = { "html", "twig", "hbs" } },
--         svelte = { filetypes = { "svelte" } },
--         lua_ls = {
--             Lua = {
--                 workspace = { checkThirdParty = false },
--                 telemetry = { enable = false },
--             },
--         },
--     }
-- },
--
-- config = function(_, opts)
--     local lspconfig = require("lspconfig")
--     -- lspconfig.lua_ls.setup({})
--     for server, config in pairs(opts.servers) do
--         -- passing config.capabilities to blink.cmp merges with the capabilities in your
--         -- `opts[server].capabilities, if you've defined it
--         config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
--         lspconfig[server].setup(config)
--     end
-- end
--
--
--
-- require('lspconfig').tailwindcss.setup {
--     filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'html', 'css' },
--     root_dir = function(fname)
--         return require('lspconfig.util').root_pattern(
--             'tailwind.config.js',
--             'tailwind.config.cjs',
--             'tailwind.config.mjs',
--             'tailwind.config.ts', -- if you also use TypeScript config files
--             'package.json',
--             'node_modules',
--             '.git'
--         )(fname) or vim.loop.os_homedir()
--     end,
--     capabilities = capabilities
-- }
