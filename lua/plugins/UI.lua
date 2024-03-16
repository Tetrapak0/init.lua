local LazyFile = {"BufReadPost", "BufWritePost", "BufNewFile"}

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            noremap = true,
            silent = true,
        },
        config = function(_, opts)
            vim.keymap.set('n', "<leader>l", ":Lazy<cr>")
            local wk = require("which-key")
            wk.setup(opts)
            wk.register({
                b = {name = "+Buffer"},
                c = {name = "+Code"},
                C = {name = "+Convert"},
                d = {name = "+Diagnostics"},
                e = {name = "+Editor", w = {"<cmd>lua vim.o.wrap = not vim.o.wrap<cr>", "Toggle Line Wrap", noremap = true, silent = true}},
                f = {name = "+File"},
                g = {name = "+goto"},
                G = {name = "+Git"},
                h = {name = "+Help"},
                l = {"<cmd>Lazy<cr>", "Lazy", noremap = true, silent = true},
                s = {name = "+Search"},
                S = {name = "+Session"},
                U = {name = "+UI"},
            },
            {prefix = "<leader>"})
        end
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    close_command = function(n) require("mini.bufremove").delete(n, false) end,
                    right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree",
                            highlight = "Directory",
                            text_align = "left",
                        },
                        {
                            filetype = "alpha"
                        },
                        {
                            filetype = "Trouble",
                            text = "Trouble",
                            text_align = "right"
                        },
                        {
                            filetype = "Outline",
                            text = "Symbol Outline",
                            text_align = "right"
                        }
                    },
                    diagnostics =  "nvim_lsp",
                    show_close_icon = false,
                    show_buffer_close_icons = false,
                    always_show_bufferline = false,
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local s = " "
                        for e, n in pairs(diagnostics_dict) do
                          local sym = e == "error" and " "
                            or (e == "warning" and " " or "" )
                          s = s .. n .. sym
                        end
                        return s
                    end
                }
            })
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            vim.o.laststatus = 3
            require("lualine").setup({
                options = {
                    globalstatus = true,
                    theme = "tokyonight",
                },
                sections = {
                    lualine_c = {
                        {
                            function()
                                return require("nvim-navic").get_location()
                            end,
                            color_correction = "static",
                            cond = function()
                                return require("nvim-navic").is_available()
                            end
                        }
                    }
                }
            })
        end,
    },
    --"goolord/alpha-nvim",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --event = "VimEnter",
    --config = function()
    --    local dashboard = require("alpha.themes.dashboard")
    --    dashboard.section.buttons.val = {
    --        dashboard.button("n", "    New File", "<cmd>ene<cr>"),
    --        dashboard.button("r", "󱋢    Recent Files", "<cmd>Telescope oldfiles<cr>"),
    --        dashboard.button("f", "󰈞    Find File", "<cmd>Telescope find_files<cr>"),
    --        dashboard.button("g", "    Live grep", "<cmd>Telescope live_grep<cr>"),
    --        dashboard.button("s", "    Restore Session", "<cmd>lua require('persistence').load()<cr>"),
    --        dashboard.button("l", "󰒲    Lazy", "<cmd>Lazy<cr>"),
    --        dashboard.button("q", "󰩈    Quit", "<cmd>wqa<cr>"),
    --    }
    --    require('alpha').setup(dashboard.opts)
    --end,
}

