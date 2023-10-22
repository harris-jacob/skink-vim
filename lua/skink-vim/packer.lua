-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Telescope for file searching/greping
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Harpoon for file hopping
    use { 'ThePrimeagen/harpoon' }

    -- Treesitter for syntax highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Themes
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    -- })

    -- use('folke/tokyonight.nvim')

    use({
        'sainnhe/everforest',
        config = function()
            vim.cmd('colorscheme everforest')
        end
    })

    -- Unimpaired
    use('tpope/vim-Unimpaired')


    -- Undo tree
    use('mbbill/undotree')

    -- Git support
    use('tpope/vim-fugitive')


    -- LSP config
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- null ls to add additional LSP functionality
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            { 'jose-elias-alvarez/typescript.nvim' },
            { "nvim-lua/plenary.nvim" }
        }
    }


    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Tabbar
    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }

    -- bufferline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- todos
    use { 'folke/todo-comments.nvim' }


    -- commentary operator
    use { 'tpope/vim-commentary' }



    -- debugger
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- copilot
    use 'github/copilot.vim'
end)
