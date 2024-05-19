return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "nightfly",
				component_separators = { left = "", right = ""},
				section_separators = { left = '', right = ''},
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 2,
					},
				},
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
			},
		})
	end,
}
