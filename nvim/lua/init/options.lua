local esc = function (text)
  return vim.api.nvim_replace_termcodes(text, true, true, true)
end

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('silent! helptags ALL')

--vim.o.shada = 'NONE'

vim.g.termguicolors = true

vim.o.mouse = 'a'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth=2

vim.o.expandtab = false

vim.o.magic = true

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.equalalways = false

vim.o.wildmenu = true
vim.o.wildmode = 'longest:full'
vim.o.wildignore = '*.o,*~,*pyc'

vim.o.list = true
vim.o.listchars = esc('tab:<bar><space>,space:-')

vim.cmd([[
  highlight SpecialKey ctermfg=237
  highlight Folded  ctermfg=yellow ctermbg=black
  highlight Pmenu ctermbg=DarkGrey ctermfg=Yellow
  highlight Pmenusel ctermbg=DarkBlue ctermfg=Yellow
  highlight VertSplit ctermbg=233 ctermfg=233
  highlight StatusLineNC ctermbg=red ctermfg=233
  highlight StatusLine ctermbg=darkgreen ctermfg=236
  highlight Search ctermbg=DarkGrey ctermfg=Yellow
  highlight QuickFixLine ctermbg=red guibg=red
]])

