local servers = {
    "asm_lsp", "clangd", "neocmake",
    "cssls", "html", "vuels", "tsserver",
    "jsonls", "marksman",
    "lua_ls", "vimls",
    "pyright",
}
local keymap_opts = {silent = true, noremap = true}
local LazyFile = {"BufReadPost", "BufWritePost", "BufNewFile"}

return {
    {
        "williamboman/mason.nvim",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstallAll",
            "MasonUninstall",
            "MasonLog"
        },
        keys = {
            {"<leader>UM", "<cmd>Mason<cr>", desc = "Mason", keymap_opts},
        },
        dependencies = {"williamboman/mason-lspconfig.nvim"},
        config = function()
            require("mason").setup()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp-signature-help"
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect"
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Esc>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.confirm({select = true}),
                }),
                sources = cmp.config.sources({
                    {name = "nvim_lsp_signature_help"},
                    {name = "buffer"},
                    {name = "path"},
                    {name = "nvim_lsp"}
                })
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        events = {"BufReadPre", "BufNewFile"},
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp", config = true},
            {"antosha417/nvim-lsp-file-operations", config = true},
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            lspconfig.asm_lsp.setup({capabilities = capabilities})
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--all-scopes-completion",
                    "--background-index",
                    "--background-index-priority=normal",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--limit-references=0",
                    "--limit-results=0",
                    "--rename-file-limit=0",
                    "--fallback-style=llvm",
                }
            })
            lspconfig.neocmake.setup({capabilities = capabilities})
            lspconfig.cssls.setup({capabilities = capabilities})
            lspconfig.html.setup({capabilities = capabilities})
            lspconfig.vuels.setup({capabilities = capabilities})
            lspconfig.tsserver.setup({capabilities = capabilities})
            lspconfig.jsonls.setup({capabilities = capabilities})
            lspconfig.marksman.setup({capabilities = capabilities})
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"}
                        }
                    }
                }
            })
            lspconfig.pyright.setup({capabilities = capabilities})
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
               local hl = "DiagnosticSign" .. type
               vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end,
        keys = {
            {"gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definition", keymap_opts},
            {"gD", vim.lsp.buf.declaration, desc = "Go to Declaration"},
            {"gr", "<cmd>Telescope lsp_references<cr>", desc = "Show References"},
            {"gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to Type Definition"},
            {"<leader>ca", vim.lsp.buf.code_action, desc = "Show Code Actions"},
            {"<leader>cr", vim.lsp.buf.rename, desc = "Rename Symbol"},
            {"<leader>dd", "<cmd>Telescope diagnostics<cr>", desc = "Show File Diagnostics"},
            {"<leader>dD", vim.diagnostic.open_float, desc = "Show Line Diagnostics"},
            {"<leader>dp", vim.diagnostic.goto_prev, desc = "Go to Previous Diagnostic"},
            {"<leader>dn", vim.diagnostic.goto_next, desc = "go to Next Diagnostic"}
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = {"BufReadPost", "BufWritePost", "BufNewFile"},
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                highlight = { enable = true },
                indent = { enable = true },
                sync_install = false,
                ensure_installed = {
                    "bash",
                    "nasm", "c", "cpp", "cmake", "meson", "ninja",
                    "css", "html", "javascript", "typescript", "tsx",
                    "lua", "vim", "vimdoc",
                    "markdown", "markdown_inline",
                    "json", "gitignore", "ini", "xml", "yaml",
                    "python",
                }
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = LazyFile,
        opts = {
            max_lines = 3,
            trim_scope = "outer"
        },
    },
    {
        "folke/neoconf.nvim",
        opts = {},
    },
    {
        "SmiteshP/nvim-navic",
        event = LazyFile,
        opts = {
            depth_limit = 0,
            highlight = true,
            safe_output = true,
            separator = " > ",
            lsp = {auto_attach = true}
        },
    },
    {
        "SmiteshP/nvim-navbuddy",
        keys = {
            {"<leader>cn", "<cmd>Navbuddy<cr>", desc = "Open Navbuddy", keymap_opts}
        },
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            local actions = require("nvim-navbuddy.actions")
            require("nvim-navbuddy").setup({
                lsp = {auto_attach = true},
                use_default_mappings = true,
                keymap = {
                    ["Up"] = actions.next_sibling(),
                    ["Down"] = actions.previous_sibling(),
                    ["Left"] = actions.parent(),
                    ["Right"] = actions.children()
                }
            })
        end
    },
}

