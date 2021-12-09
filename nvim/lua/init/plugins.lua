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
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame_opts = {
          delay = 100,
        },
        max_file_length = 40000,
        preview_config = {
          border   = 'none',
          focusable = true,
        },
        keymaps = {
          noremap = true,
          ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
          ['n <leader>gj'] = '<cmd>Gitsigns next_hunk<CR>',
          ['n <leader>gk'] = '<cmd>Gitsigns prev_hunk<CR>',
          ['n <leader>ghs'] = '<cmd>Gitsigns stage_hunk<CR>',
          ['n <leader>ghp'] = '<cmd>Gitsigns preview_hunk<CR>',

          -- Text objects
          ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
          ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>',
        },
      })
      vim.cmd([[
        highlight GitSignsAdd ctermfg=green ctermbg=black
        highlight GitSignsChange ctermfg=Magenta ctermbg=black
        highlight GitSignsDelete ctermfg=red ctermbg=black
      ]])
    end,
  }

  -- Automatically set up configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').compile()
    require('packer').sync()
  end
end)

