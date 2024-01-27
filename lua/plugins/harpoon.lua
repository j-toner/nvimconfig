return {
	"theprimeagen/harpoon",
	branch = "harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add Harpoon" })
		vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Open Harpoon" })
		vim.keymap.set("n", "<C-g>", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<C-j>", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<C-b>", function()
			ui.nav_file(4)
		end)
	end,
	-- config = function()
	-- 	local harpoon = require("harpoon")
	-- 	harpoon:setup()
	-- 	vim.keymap.set("n", "<leader>a", function()
	-- 		harpoon:list():append()
	-- 	end)
	-- 	vim.keymap.set("n", "<C-e>", function()
	-- 		harpoon.ui:toggle_quick_menu(harpoon:list())
	-- 	end)
	--
	-- 	vim.keymap.set("n", "<C-g>", function()
	-- 		harpoon:list():select(1)
	-- 	end)
	-- 	vim.keymap.set("n", "<C-h>", function()
	-- 		harpoon:list():select(2)
	-- 	end)
	-- 	vim.keymap.set("n", "<C-j>", function()
	-- 		harpoon:list():select(3)
	-- 	end)
	-- 	vim.keymap.set("n", "<C-b>", function()
	-- 		harpoon:list():select(4)
	-- 	end)
	--
	-- 	-- Toggle previous & next buffers stored within Harpoon list
	-- 	vim.keymap.set("n", "<C-S-P>", function()
	-- 		harpoon:list():prev()
	-- 	end)
	-- 	vim.keymap.set("n", "<C-S-N>", function()
	-- 		harpoon:list():next()
	-- 	end)
	-- end,
}
