return {

    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        
        local dashboard = require("alpha.themes.theta")
        -- local dashboard = require("alpha.themes.dashboard")

        dashboard.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        _Gopts = {
            position = "center",
            hl = "Type",
            -- wrap = "overflow";
        }

        local function footer()
            return "Haskell can suck mo' nads"
        end

       alpha.setup(dashboard.config)
        -- alpha.setup(dashboard.opts)

        -- dashboard.section.footer.val = require("alpha.fortune")()
        -- dashboard.section.terminal.command = "alacritty"
        -- dashboard.section.terminal.command = "pwd"
        -- dashboard.section.buttons.val = {
        --     dashboard.button("e", "  New file", "<cmd>ene <CR>"),
        --     dashboard.button("SPC f f", "󰈞  Find file"),
        --     dashboard.button("SPC ?", "󰊄  Recently opened files"),
        --     -- dashboard.button("SPC f r", "  Frecency/MRU"),
        --     dashboard.button("SPC f g", "󰈬  Find word"),
        --     dashboard.button("SPC f h", "󰋗  Get Help"),
        --     -- dashboard.button("SPC f m", "  Jump to bookmarks"),
        --     -- dashboard.button("SPC s l", "  Open last session"),
        --     dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        -- }

        -- dashboard.opts.noautocmd = true
-- alpha.setup(dashboard.config)
        -- require("alpha.term")
        -- dashboard.buttons.val.position = "left"
    end,
}
