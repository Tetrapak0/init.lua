local keymap_opts = { noremap = true, silent = true }
local LazyFile = {"BufReadPost", "BufWritePost", "BufNewFile"}

return {
    {
        "booperlv/nvim-gomove",
        event = LazyFile,
        config = function()
            vim.keymap.set('n', "<A-k>", "<Plug>GoNSMUp", keymap_opts)
            vim.keymap.set('n', "<A-Up>", "<Plug>GoNSMUp", keymap_opts)
            vim.keymap.set('n', "<A-j>", "<Plug>GoNSMDown", keymap_opts)
            vim.keymap.set('n', "<A-Down>", "<Plug>GoNSMDown", keymap_opts)
            vim.keymap.set('n', "<A-h>", "<Plug>GoNSMLeft", keymap_opts)
            vim.keymap.set('n', "<A-Left>", "<Plug>GoNSMLeft", keymap_opts)
            vim.keymap.set('n', "<A-l>", "<Plug>GoNSMRight", keymap_opts)
            vim.keymap.set('n', "<A-Right>", "<Plug>GoNSMRight", keymap_opts)

            vim.keymap.set('x', "<A-k>", "<Plug>GoVSMUp", keymap_opts)
            vim.keymap.set('x', "<A-Up>", "<Plug>GoVSMUp", keymap_opts)
            vim.keymap.set('x', "<A-j>", "<Plug>GoVSMDown", keymap_opts)
            vim.keymap.set('x', "<A-Down>", "<Plug>GoVSMDown", keymap_opts)
            vim.keymap.set('x', "<A-h>", "<Plug>GoVSMLeft", keymap_opts)
            vim.keymap.set('x', "<A-Left>", "<Plug>GoVSMLeft", keymap_opts)
            vim.keymap.set('x', "<A-l>", "<Plug>GoVSMRight", keymap_opts)
            vim.keymap.set('x', "<A-Right>", "<Plug>GoVSMRight", keymap_opts)

            vim.keymap.set('n', "<A-S-k>", "<Plug>GoNSDUp", keymap_opts)
            vim.keymap.set('n', "<A-S-Up>", "<Plug>GoNSDUp", keymap_opts)
            vim.keymap.set('n', "<A-S-j>", "<Plug>GoNSDDown", keymap_opts)
            vim.keymap.set('n', "<A-S-Down>", "<Plug>GoNSDDown", keymap_opts)
            vim.keymap.set('n', "<A-S-h>", "<Plug>GoNSDLeft", keymap_opts)
            vim.keymap.set('n', "<A-S-Left>", "<Plug>GoNSDLeft", keymap_opts)
            vim.keymap.set('n', "<A-S-l>", "<Plug>GoNSDRight", keymap_opts)
            vim.keymap.set('n', "<A-S-Right>", "<Plug>GoNSDRight", keymap_opts)

            vim.keymap.set('x', "<A-S-k>", "<Plug>GoVSDUp", keymap_opts)
            vim.keymap.set('x', "<A-S-Up>", "<Plug>GoVSDUp", keymap_opts)
            vim.keymap.set('x', "<A-S-j>", "<Plug>GoVSDDown", keymap_opts)
            vim.keymap.set('x', "<A-S-Down>", "<Plug>GoVSDDown", keymap_opts)
            vim.keymap.set('x', "<A-S-h>", "<Plug>GoVSDLeft", keymap_opts)
            vim.keymap.set('x', "<A-S-Left>", "<Plug>GoVSDLeft", keymap_opts)
            vim.keymap.set('x', "<A-S-l>", "<Plug>GoVSDRight", keymap_opts)
            vim.keymap.set('x', "<A-S-Right>", "<Plug>GoVSDRight", keymap_opts)
        end,
        opts = {
            map_defaults = false,
            reindent = true,
            move_past_end_col = true
        }
    },
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        opts = {
            modes = {insert = true, terminal = true, command = true},
            mappings = {
                ['('] = {action = "open", pair = "()", neigh_pattern = "[^\\]."},
                ['['] = {action = "open", pair = "[]", neigh_pattern = "[^\\]."},
                ['{'] = {action = "open", pair = "{}", neigh_pattern = "[^\\]."},

                [')'] = {action = "close", pair = "()", neigh_pattern = "[^\\]."},
                [']'] = {action = "close", pair = "[]", neigh_pattern = "[^\\]."},
                ['}'] = {action = "close", pair = "{}", neigh_pattern = "[^\\]."},

                ['"'] = {action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = {cr = false}},
                ["'"] = {action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = {cr = false}},
                ['`'] = {action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = {cr = false}},
            }
        }
    },
    {
        "echasnovski/mini.surround",
        event = LazyFile,
        opts = {
            custom_surroundings = {
                ['<'] = {output = {left = '<', right = '>'}},
                ['>'] = {output = {left = '<', right = '>'}},
                ['('] = {output = {left = '(', right = ')'}},
                [')'] = {output = {left = '(', right = ')'}},
                ['['] = {output = {left = '[', right = ']'}},
                [']'] = {output = {left = '[', right = ']'}},
                ['{'] = {output = {left = '{', right = '}'}},
                ['}'] = {output = {left = '{', right = '}'}},
            },
            -- silent = true
        }
    },
    {
        "folke/todo-comments.nvim",
        event = LazyFile,
        keys = {
            {"<leader>ct", "<cmd>TodoTelescope<cr>", desc = "Open TODO Telescope"},
            {"<leader>ch", "<cmd>TodoTrouble<cr>", desc = "Open TODO Trouble"}
        },
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {
            keywords = {
                FIX = {
                    alt = {"URGENT"}
                },
                WARN = {
                    alt = {"WTF"}
                }
            }
        }
    },
    {
        "LunarVim/bigfile.nvim",
        event = LazyFile,
        opts = {},
    },
    {
        "RRethy/vim-illuminate",
        event = LazyFile,
        opts = {
            delay = 100,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = {"lsp"},
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end,
                {
                    desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference",
                    buffer = buffer
                })
            end

            map("]]", "next")
            map("[[", "prev")

            vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
            end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = LazyFile,
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = LazyFile,
        config = function()
            require("ibl").setup()
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                priority = {
                    [''] = 110,
                    lua = 210,
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end,
    },
}

