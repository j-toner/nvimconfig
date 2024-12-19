return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
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
			},
			sync_install = false, -- I added this
			ignore_install = {}, -- I added this
			modules = {}, -- I added this to make the warning go away
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
		})
	end,
}
