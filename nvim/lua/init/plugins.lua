local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'justinmk/vim-dirvish'
  use 'tpope/vim-surround'
  use 'sheerun/vim-polyglot'
  use 'tjdevries/nlua.nvim'
  use { 'hrsh7th/vim-vsnip', config = function()
    vim.cmd([[
      let g:vsnip_filetypes = {}
      let g:vsnip_filetypes.javascriptreact = ['javascript']
      let g:vsnip_filetypes.typescriptreact = ['typescript']
    ]])
  end }
  use 'hrsh7th/vim-vsnip-integ'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'theHamsta/nvim-treesitter-pairs'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'

  use {
    'David-Kunz/cmp-npm',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- Automatically set up configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').compile()
    require('packer').sync()
  end
end)

