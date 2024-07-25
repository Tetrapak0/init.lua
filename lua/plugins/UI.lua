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
            sort = {"manual"},
            icons = {
                mappings = false,
            },
            spec = {
                mode = {'n', 'v'},
                {"<leader>b", group = "Buffer"},
                {"<leader>C", group = "Convert"},
                {"<leader>c", group = "Code"},
                {"<leader>d", group = "Diagnostics"},
                {"<leader>E", group = "Editor"},
                {"<leader>Ew", "<cmd>lua vim.o.wrap = not vim.o.wrap<cr>", desc = "Toggle line wrap"},
                {"<leader>f", group = "File"},
                {"<leader>G", group = "Git"},
                {"g", group = "goto"},
                {"<leader>h", group = "Help"},
                {"<leader>l", "<cmd>Lazy<cr>", desc = "Lazy"},
                {"<leader>S", group = "Session"},
                {"<leader>s", group = "Search"},
                {"<leader>U", group = "UI"},
            },
            noreap = true,
            silent = true,
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("lualine").setup({
                options = {
                    globalstatus = true,
                    theme = "vscode",
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
}

