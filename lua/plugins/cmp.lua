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
                },
            })
            -- cmp.setup {
            --     sources = cmp.config.sources({
            --         { name = "cody" },
            --         { name = "nvim_lsp" }
            --     })
            -- }
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        -- config = function()
        --     local cmp = require("cmp")
        --     local luasnip = require("luasnip")
        --     cmp.setup({
        --         snippet = {
        --             expand = function(args)
        --                 luasnip.lsp_expand(args.body)
        --             end,
        --         },
        --         window = {
        --             completion = cmp.config.window.bordered(),
        --             documentation = cmp.config.window.bordered(),
        --         },
        --         mapping = cmp.mapping.preset.insert({
        --             ["<C-n>"] = cmp.mapping.select_next_item(),
        --             ["<C-p>"] = cmp.mapping.select_prev_item(),
        --             ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        --             ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --             ["<C-Space>"] = cmp.mapping.complete({}),
        --             ["<CR>"] = cmp.mapping.confirm({
        --                 behavior = cmp.ConfirmBehavior.Replace,
        --                 select = true,
        --             }),
        --             ["<Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_next_item()
        --                 elseif luasnip.expand_or_locally_jumpable() then
        --                     luasnip.expand_or_jump()
        --                 else
        --                     fallback()
        --                 end
        --             end, { "i", "s" }),
        --             ["<S-Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_prev_item()
        --                 elseif luasnip.locally_jumpable(-1) then
        --                     luasnip.jump(-1)
        --                 else
        --                     fallback()
        --                 end
        --             end, { "i", "s" }),
        --         }),
        --         sources = {
        --             { name = "nvim_lsp" },
        --             { name = "luasnip" },
        --             { name = "cody" },
        --         },
        --     })
        -- end,
    },
    { url = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
}
