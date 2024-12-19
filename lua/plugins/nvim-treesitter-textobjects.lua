return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "rust", "toml", "tsx", "javascript", "typescript" },
            ignore_install = { "phpdoc" },
            sync_install = false,
            auto_install = true,
            modules = {},
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
