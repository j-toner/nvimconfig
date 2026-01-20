return {
	"saghen/blink.cmp",
	dependencies = {
		-- "rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		version = "2.*",
		"luckasRanarison/tailwind-tools.nvim",
		-- "onsails/lspkind.nvim",
	},
	version = "v1.*",
	opts = {
		keymap = {
			preset = "none",
			-- List only the keys you WANT Blink to use
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-CR>"] = { "select_and_accept", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-d>"] = { "show_documentation", "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "show_documentation", "scroll_documentation_up", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				snippets = { opts = { extended_filetypes = { svelte = { "javascript", "typescript", "html", "css" }, javascript = { "typescript" }, typescript = { "javascript" } } } },
			},
		},
		completion = {
			documentation = { auto_show = true, window = { border = "rounded" } },
			accept = { auto_brackets = { enabled = true } },
			trigger = { show_on_keyword = true },
			ghost_text = { enabled = false },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
		},
	},
}
