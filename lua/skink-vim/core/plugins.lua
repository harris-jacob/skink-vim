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

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('skink-vim.plugins.nvim-cmp')
    end,
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
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
  })

  -- git commands
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git',
  })

  -- Lua
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


  use({
    't9md/vim-choosewin'
  })


  if packer_mod.first_install then
    packer.sync()
  end
end)
