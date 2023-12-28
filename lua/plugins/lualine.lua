return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "dracula",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 2,
					},
				},
			},
		})
	end,
}
