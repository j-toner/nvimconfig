require("rollercoder.remap")
require("rollercoder.set")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- { 'rose-pine/neovim', name = 'rose-pine' },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        name = 'tokyonight',
        priority = 1000,
        opts = {},
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 'theprimeagen/harpoon' },
    --list troubles with code
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    { "mbbill/undotree" },
    -- git gutter
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },
    -- { "tpope/vim-fugitive" }, replaced with lazy git
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        -- opts = {
        --     -- make sure mason installs the server
        --     servers = {
        --         -- html
        --         html = {
        --             filetypes = { "html", "javascript", "typescript"},
        --         },
        --         -- Emmet
        --         emmet_ls = {
        --             init_options = {
        --                 html = {
        --                     options = {
        --                         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        --                         ["bem.enabled"] = true,
        --                     },
        --                 },
        --             },
        --         },
        --         -- CSS
        --         cssls = {},
        --     },
        -- },
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { "rafamadriz/friendly-snippets" },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        'L3MON4D3/LuaSnip',
        -- config = function()
        --     require("luasnip.loaders.from_vscode").lazy_load()
        -- end,
        dependencies = { "rafamadriz/friendly-snippets" }
    },
    -- Useful plugin to show you pending keybinds.
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'echasnovski/mini.pairs',
        config = function()
            require('mini.pairs').setup()
        end,
        version = false
    }, --auto pairs chars {}[]()""''
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim',       opts = {} },
    -- visually select then press s<char> or press sa{motion}{char}
    {
        "ur4ltz/surround.nvim",
        config = function()
            require "surround".setup { mappings_style = "surround" }
        end
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { 'ryanoasis/vim-devicons' },
    -- { 'kyazdani42/nvim-web-devicons' },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                   lualine_c = {
                           {
                                   'filename',
                                   path = 2,
                               }
                           }
                        }
        },
    },
    { 'mg979/vim-visual-multi', branch = 'master' }
})
--
-- -- [[ Highlight on yank ]]
-- -- See `:help vim.highlight.on_yank()`
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = '*',
-- })
