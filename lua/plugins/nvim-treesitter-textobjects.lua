return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of assignment" },
					},
				},
			},
		})
	end,
}
