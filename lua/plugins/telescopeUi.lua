local telescope = require("telescope")
local themes = require("telescope.themes")
return {


    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
        -- This is your opts table
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    themes.get_dropdown({
                        -- even more opts
                    }),
                },
            },
        })
        --         -- To get ui-select loaded and working with telescope, you need to call
        --         -- load_extension, somewhere after setup function:
        telescope.load_extension("ui-select")
    end,
}
