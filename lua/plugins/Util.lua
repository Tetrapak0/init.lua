local keymap_opts = {silent = true, noremap = true}
local LazyFile = {"BufReadPost", "BufWritePost", "BufNewFile"}
local BuildCord = nil

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
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = {{"<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline"}},
        config = true,
    },
    {
        "vyfor/cord.nvim",
        event = LazyFile,
        init = function()
            local username, homepath
            if vim.loop.os_uname().sysname == "Windows_NT" then
                username = os.getenv("USERNAME")
                homepath = os.getenv("USERPROFILE")
                BuildCord = "build.bat"
            else
                username = os.getenv("USER")
                homepath = os.getenv("HOME")
                BuildCord = "./build"
            end
            if username == nil then
                username = ""
            else
                username = tostring(username)
            end
            if homepath == nil then
                homepath = ""
            else
                homepath = tostring(homepath)
            end
            require("cord").setup({
                usercmds = true,        -- Enable user commands
                timer = {
                    enable = true,             -- Enable automatically updating presence
                    interval = 1500,           -- Interval between presence updates in milliseconds (min 500)
                    reset_on_idle = false,     -- Reset start timestamp on idle
                    reset_on_change = false,   -- Reset start timestamp on presence change
                },
                editor = {
                    image = nil,         -- Image ID or URL in case a custom client id is provided
                    client = 'neovim',   -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
                    tooltip = 'Neovim',
                },
                display = {
                    show_time = true,             -- Display start timestamp
                    show_repository = true,
                    show_cursor_position = true,
                    swap_fields = false,          -- If enabled, workspace is displayed first
                    workspace_blacklist = {username, homepath},
                },
                lsp = {
                    show_problem_count = true,
                    severity = 1,           -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
                    scope = "workspace",    -- buffer or workspace
                },
                idle = {
                    enable = true,
                    show_status = true,
                    timeout = 300000,
                    disable_on_focus = true,
                    text = 'Idle',
                    tooltip = 'Idle',
                },
                text = {
                    viewing = "Viewing {}",
                    editing = "Editing {}",
                    file_browser = "",
                    plugin_manager = "",
                    lsp_manager = "",
                    vcs = "",
                    workspace = "In {}",
                },
                buttons = {
                    {
                        label = 'View Repository',
                        url = 'git'
                    },
                },
            })
        end,
        build = BuildCord
    },
}

