# init.lua - My Neovim configuration
Feel free to open a Pull Request with your additions.

## Plugins (47)
### lua/config/lazy.lua: 
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Package manager
### lua/plugins/Editor.lua
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - git diff signs
- [hex.nvim](https://github.com/RaafatTurki/hex.nvim) - Better hex editor for Neovim
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides
- [mini.comment](https://github.com/echasnovski/mini.comment) - Comment out lines or code blocks
- [mini.pairs](https://github.com/echasnovski/mini.pairs) - Create character pair
- [mini.surround](https://github.com/echasnovski/mini.surround) - Surround word with character
- [nvim-gomove](https://github.com/booperlv/nvim-gomove) - Move or duplicate selection in direction of choice
- [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) - Bracket pair colorizer
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - TODO comment highliter
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Code diagnostics viewer
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - Highlight all occurrences
### lua/plugins/File.lua
- [mini.bufremove](https://github.com/echasnovski/mini.bufremove) - Better buffer removal
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - The everything finder
- [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser) - File browser using Telescope
- [undotree](https://github.com/jiaoshijie/undotree) - File history
### lua/plugins/LSP.lua
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Code completion for words in buffer
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP code completion
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Filesystem code completion
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP package manager
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Better nvim-lspconfig integration for Mason
- [neodev.nvim](https://github.com/folke/neodev.nvim) - Neovim API signature help
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine for Neovim
- [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) - Update file mentions in code based on file events in NvimTree
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP handler
- [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy) - Symbol navigation
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) - Breadcrumbs
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Code grammar parser
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Breadcrumb-like top bar, that shows code context
### lua/plugins/Themes.lua
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
### lua/plugins/UI.lua
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - Improve vim.ui
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Better status line
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - Sidebar file explorer
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keymap help
### lua/plugins/Util.lua
- [bigfile.nvim](https://github.com/LunarVim/bigfile.nvim) - Makes editing larger files smoother
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - git diff for Neovim
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown preview
- [nvim-conv](https://github.com/simonefranza/nvim-conv) - Unit converter
- [persistence.nvim](https://github.com/folke/persistence.nvim) - Session manager
- [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Search and replace
- [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - List of symbols in current file
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Flexible terminal emulator
### Plugin dependencies
- [cmp-nvim-lsp-signature-help]("https://github.com/hrsh7th/cmp-nvim-lsp-signature-help") - Show function signature
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - nvim-navbuddy
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - undotree telescope-file-browser.nvim todo-comments.nvim nvim-lsp-file-operations
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - telescope.nvim
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - nvim-tree lualine.nvim
