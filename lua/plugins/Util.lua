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
        'RaafatTurki/hex.nvim',
        opts = {},
        keys = {
            {"<leader>Eh", "<cmd>:HexToggle<cr>", desc = "Toggle Hex Editor"}
        }
    },
    {
        "echasnovski/mini.comment",
        event = LazyFile,
        opts = {
            current_line = "gcc",
            comment_visual = "gc"
       }
    }
}

