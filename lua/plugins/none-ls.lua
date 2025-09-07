return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.rustywind,
				-- -- null_ls.builtins.formatting.golangci_lint_langserver,
				-- null_ls.builtins.formatting.svelte,
				-- null_ls.builtins.completion.svelte,
				-- null_ls.builtins.completion.tailwindcss,
				-- null_ls.builtins.diagnostics.rust_analyzer,
				-- null_ls.builtins.diagnostics.markuplint,
				-- null_ls.builtins.diagnostics.eslint_d,
				-- null_ls.builtins.completion.luasnip,
				-- null_ls.builtins.code_actions.eslint_d,
			},
		})
	end,
}
