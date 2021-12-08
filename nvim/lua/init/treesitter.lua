--[[

Debugging:
:checkhealth nvim_treesitter
:TSUpdate


Proxy setup:
require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "<proxy url>" },
}

--local ts_utils = require 'nvim-treesitter.ts_utils'
--:h nvim-treesitter-utils

--]]

require("nvim-treesitter.configs").setup {
  ensure_installed = 'all',
  ignore_install = {
    'haskell',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {
      'perl',
    },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 10000, -- Do not enable for files with more than n lines, int
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader>v',
      node_incremental = '<leader>k',
      node_decremental = '<leader>j',
      --scope_incremental = "grc",
    },
  },
  indent = {
    enable = true,
  },
  pairs = {
    enable = true,
    fallback_cmd_normal = 'normal! %',
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "javascriptflow"

--[[ Folding
vim.wo.foldmethod = 'expr'
vim.o.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
--]]

