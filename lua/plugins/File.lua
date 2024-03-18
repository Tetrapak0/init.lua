local command = "Telescope find_files search_dirs=" .. vim.fn.fnameescape(vim.fn.stdpath("config"))
local keymap_opts = {silent = true, noremap = true}
local Terminal = nil
local lazygit = nil

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        keys = {
            {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Search Open Buffers"},
            {"<leader>fc", "<cmd>" .. command .. "<cr>", desc = "Search Config Files"},
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"},
            {"<leader>Gf", "<cmd>Telescope git_files<cr>", desc = "Git Files"},
            {"<leader>hm", "<cmd>Telescope help_tags<cr>", desc = "Search Manuals"},
            {"<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "grep"},
            {"<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "grep string"},
            {"<leader>Uc", "<cmd>Telescope colorscheme<cr>", desc = "Set Colorscheme"},
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 1,
                path_display = {"smart"},
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                },
            }
        },
        lazy = true,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        cmd = "Telescope file_browser",
        keys = {
            {"<leader>fs", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser", keymap_opts}
        },
        dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    },
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "<leader>fu", "<cmd>lua require('undotree').toggle()<cr>", desc = "UndoTree" },
        },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        opts = {
            mode = "workspace_diagnostics",
            use_diagnostic_signs = true,
            position = "right",
        },
        keys = {
            {"<leader>dt", "<cmd>TroubleToggle<cr>", desc = "Show Trouble", keymap_opts}
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            view = {width = 32},
            renderer = {group_empty = true},
            diagnostics = {enable = true},
        },
        keys = {
            {"<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree"}
        }
    },
    {
        "echasnovski/mini.bufremove",
        keys = {
            {
                "<leader>bd",
                function()
                    local bd = require("mini.bufremove").delete
                    if vim.bo.modified then
                        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                        if choice == 1 then
                            vim.cmd.write()
                            bd(0)
                        elseif choice == 2 then
                            bd(0, true)
                        end
                    else
                        bd(0)
                    end
                end,
                desc = "Delete Buffer",
            },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
        opts = {}
    },
}

