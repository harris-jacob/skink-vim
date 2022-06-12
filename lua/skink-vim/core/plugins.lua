local packer_mod = require('skink-vim.packer')
local packer = packer_mod.packer
local config = require('skink-vim.config')

return packer.startup(function(use)
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
  })


  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('skink-vim.plugins.nvim-tree')
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
    event = 'VimEnter',
  })

  -- file navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('skink-vim.plugins.telescope')
    end,
    event = 'BufWinEnter',
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    -- config = function()
    --   require('skink-vim.lsp')
    -- end,
    requires = {
      { 'b0o/SchemaStore.nvim' },
      { 'williamboman/nvim-lsp-installer' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('skink-vim.plugins.lsp-signature')
        end,
        after = 'nvim-lspconfig',
      },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('skink-vim.lsp.providers.null-ls')
        end,
        after = 'nvim-lspconfig',
      },
    },
  })

  -- golang support
  use({
    'fatih/vim-go',
    cmd = {'GoInstallBinaries'}
  })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('skink-vim.plugins.nvim-cmp')
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('skink-vim.plugins.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('skink-vim.plugins.auto-pairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter'
  })

  -- git commands
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git',
  })

  -- key commands
  use {
    "folke/which-key.nvim",
    config = function()
      require('skink-vim.plugins.which-key')
    end
  }

  require('skink-vim.theme.plugins').init(use, config)

  -- -- session/project management
  use({
    'glepnir/dashboard-nvim',
    config = function()
      require('skink-vim.plugins.dashboard')
    end,
  })

  -- lang/syntax
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    run = ':TSUpdate',
    config = function()
      require('skink-vim.plugins.treesitter')
    end,
  })


  -- UI
  use({
    'CosmicNvim/cosmic-ui',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('skink-vim.plugins.cosmic-ui')
    end,
    event = 'BufWinEnter',
  })

  -- Icons
  use(
    { 'kyazdani42/nvim-web-devicons' }
  )

  -- Terminal
  use({
    'voldikss/vim-floaterm',
    opt = true,
    event = 'BufWinEnter',
    config = function()
      require('skink-vim.plugins.terminal')
    end,
  })


  -- tab/buffer line
  use({
    'akinsho/bufferline.nvim',
    tag = "v2.*",
  })

  require('skink-vim.plugins.bufferline')

  -- notification toast
  use({
    'rcarriga/nvim-notify',
  })

  if packer_mod.first_install then
    packer.sync()
  end
end)
