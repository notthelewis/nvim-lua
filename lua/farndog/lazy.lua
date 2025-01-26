local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap Lazy.nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

    -- Custom plugin
    -- {
    --     -- dev = true,
    --     dir = '/home/lewis/devel/nvim-plugins/tj-tutorial'
    -- },

    -- Copilot
    'github/copilot.vim',

    -- Theme
    'ellisonleao/gruvbox.nvim',

    -- File finder 
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',

    'theprimeagen/harpoon',

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',

    -- Git integration
    'tpope/vim-fugitive',

    -- LSP
    'neovim/nvim-lspconfig',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Snippets
    { "hrsh7th/nvim-cmp", event = { "InsertEnter", "CmdlineEnter" } },
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',

    'MunifTanjim/prettier.nvim',

    -- Syntax highlighting for cassandra
    'elubow/cql-vim',

    -- Autoclose
    'm4xshen/autoclose.nvim',

    -- Status line
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',

    'folke/todo-comments.nvim',

    -- Highlight
    'brenoprata10/nvim-highlight-colors',

    'aca/emmet-ls',

    -- Oil 
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },

    -- Comment
    'numToStr/Comment.nvim',
})
