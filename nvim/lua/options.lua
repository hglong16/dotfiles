local opt = vim.opt


-- Global
opt.smartcase = true
opt.updatetime = 300
opt.splitright = true
opt.showmatch = true
opt.showtabline = 2
opt.scrolloff = 7
opt.termguicolors = true
opt.shortmess:append({ c = true, F = true })
opt.clipboard:append({ 'unnamedplus' })
opt.fillchars = 'eob: '


-- Local to window
opt.number = true
opt.relativenumber = true
opt.cursorline = true
vim.cmd([[hi clear CursorLine]])
vim.cmd([[hi CursorLine gui=underline cterm=underline]])
opt.list = true
opt.listchars = 'tab:\\ ,trail:-,eol:↵'
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- Hack indent-blankline https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
opt.colorcolumn = '99999'


-- Local to bufffer
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.swapfile = false
