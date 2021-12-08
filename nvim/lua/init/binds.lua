vim.g.mapleader = '/'

local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then modes = {modes} end
  for _, mode in ipairs(modes) do vim.api.nvim_set_keymap(mode, lhs, rhs, opts) end
end

local silent = { silent = true }

map('n', '<leader>q', '<cmd>bdelete!<cr>', silent)
map('n', 'q', '<cmd>q<cr>', silent)

map('n', '<C-J>', '<C-W><C-J>', silent)
map('i', '<C-J>', '<C-O><C-J>', silent)
map('t', '<C-J>', [[<C-\><C-N><C-W><C-J>i]], silent)
map('n', '<C-K>', '<C-W><C-K>', silent)
map('i', '<C-K>', '<C-O><C-K>', silent)
map('t', '<C-K>', [[<C-\><C-N><C-W><C-K>i]], silent)
map('n', '<C-L>', '<C-W><C-L>', silent)
map('i', '<C-L>', '<C-O><C-L>', silent)
map('t', '<C-L>', [[<C-\><C-N><C-W><C-L>i]], silent)
map('n', '<C-H>', '<C-W><C-H>', silent)
map('i', '<C-H>', '<C-O><C-H>', silent)
map('t', '<C-H>', [[<C-\><C-N><C-W><C-H>i]], silent)

map('n', '<leader><C-J>', '<C-W>J', silent)
map('n', '<leader><C-K>', '<C-W>K', silent)
map('n', '<leader><C-L>', '<C-W>L', silent)
map('n', '<leader><C-H>', '<C-W>H', silent)

map('n', '<leader>1', '<cmd>res 3<cr>', silent)
map('n', '<leader>2', '<cmd>res 6<cr>', silent)
map('n', '<leader>3', '<cmd>res 9<cr>', silent)
map('n', '<leader>4', '<cmd>res 12<cr>', silent)
map('n', '<leader>5', '<cmd>res 15<cr>', silent)
map('n', '<leader>0', '<cmd>res 0<cr>', silent)

map('n', '<leader>wh', '<C-W>_', silent)
map('n', '<leader>ww', '<C-W><bar>', silent)
map('n', '<leader>wn', '<C-W>=', silent)

map('n', '<space>', '/')

map('n', 'J', '<C-D>', silent)
map('n', 'K', '<C-U>', silent)
map('n', 'H', '0', silent)
map('n', 'L', '$', silent)
map('n', '<bar>', 'J', silent)
map('n', 'Y', 'y$', silent)
map('n', 'S', 'v$s', silent)

map('n', '<leader>rce', '<cmd>tabedit ~/.config/nvim/lua/<cr>', silent)

map('n', '<leader>tn', '<cmd>tabnew<cr>', silent)
map('n', '<leader>tt', '<C-W>T', silent)

-- terminal
map('t', '<esc>', [[<C-\><C-n>]])
map('n', '<leader>z', '<cmd>new<cr><cmd>terminal<cr>', silent)
map('n', '<leader>zt', '<cmd>tabnew<cr><cmd>terminal<cr>', silent)
map('n', '<leader>zv', '<cmd>vnew<cr><cmd>terminal<cr>', silent)

map('t', '<esc>', [[<C-\><C-n>]])

