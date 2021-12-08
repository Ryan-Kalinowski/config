--[[ For debugging:
  :CmpStatus
--]]

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.o.completeopt = 'menu,menuone,longest,preview'

local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
    ['<C-J>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-K>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-Y>'] = cmp.config.disable, -- disable default mapping
    ['<ESC>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        --cmp.abort()
      else
        fallback()
      end
      --end, {'c', 'i', 's'}),
    end),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {'c', 'i', 's'}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      else
        fallback()
      end
    end, {'c', 'i', 's'}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'npm', keyword_length = 4 },
    { name = 'buffer' },
  }),
  completion = {
    autocomplete = false,
  },
}

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    })
})

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('?', {
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

require('cmp-npm').setup({})

