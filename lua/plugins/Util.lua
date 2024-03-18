local keymap_opts = {silent = true, noremap = true}
local LazyFile = {"BufReadPost", "BufWritePost", "BufNewFile"}

return {
    {
        "simonefranza/nvim-conv",
        cmd = {
            "ConvDec",
            "ConvHex",
            "ConvOct",
            "ConvBin",
            "ConvStr",
            "ConvBytes",
            "ConvFarenheit",
            "ConvCelsius",
            "ConvDataTransRate",    -- <value> <fromUnit> <toUnit>
            "ConvMetricImperial",   -- all units. mass and size
            "ConvColor",
            "ConvSetPrecision"
        },
        keys = {
            {"<leader>Ch", "<cmd>ConvHex<space>", desc = "Convert to Hex"},
            {"<leader>Cd", "<cmd>ConvDec<space>", desc = "Convert to Decimal"},
            {"<leader>Co", "<cmd>ConvOct<space>", desc = "Convert to Octal"},
            {"<leader>Cb", "<cmd>ConvBin<space>", desc = "Convert to Binary"},
            {"<leader>Cs", "<cmd>ConvStr<space>", desc = "Convert to String"},
            {"<leader>Ct", "<cmd>ConvBytes<space>", desc = "Convert to Bytes"},
            {"<leader>Cc", "<cmd>ConvColor<space>", desc = "Convert Color"},
        }
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        keys = {
            {"<leader>Sr", "<cmd>lua require('persistence').load()<cr>", desc = "Restore session"},
        },
    },
    {
        "cshuaimin/ssr.nvim",
        keys = {
            {"<leader>sr", "<cmd>lua require('ssr').open()<cr>", mode = {'n', 'x'}, desc = "Search and Replace", keymap_opts}
        },
        opts = {
            keymaps = {
                close = 'q',
                prev_match = 'p',
                next_match = 'n',
                replace_confirm = "<cr>",
                replace_all = "<S-cr>",
            }
        }
    },
    {
        "echasnovski/mini.comment",
        event = LazyFile,
        opts = {
            current_line = "gcc",
            comment_visual = "gc"
       }
    },
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewFileHistory",
            "DiffviewToggleFiles",
            "DiffviewRefresh"
        },
        keys = {
            {"<leader>Gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diff View"},
            {"<leader>GD", "<cmd>DiffviewClose<cr>", desc = "Close Diff View"},
            {"<leader>Gr", "<cmd>DiffViewRefresh<cr>", desc = "Refresh Diff View"},
            {"<leader>Gh", "<cmd>DiffviewFileHistory<cr>", desc = "Toggle File History"}
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreviewToggle", "MarkdownPreview"},
        keys = {
            {"<leader>Em", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview", keymap_opts}
        },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = {
            "ToggleTerm",
            "TermExec",
        },
        keys = {
            {"<leader>t", "<cmd>ToggleTerm<cr>", desc = "Open Terminal"},
            {
                "<leader>Gl",
                function()
                    lazygit:toggle()
                end,
                desc = "lazygit"
            }
        },
        init = function()
            Terminal = require('toggleterm.terminal').Terminal
            lazygit  = Terminal:new({cmd = "lazygit"})
        end,
        opts = {
            direction = "float", -- vertical horizontal tab
            persist_mode = true,
            border = "shadow"
        },
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = {{"<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline"}},
        config = true,
    },
}

