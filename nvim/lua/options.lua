local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local utils = require 'setup.utils'
local autocmd = utils.autocmd


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
opt.lazyredraw = true
opt.hidden = true


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


-- Autocommands
autocmd('start_screen', [[VimEnter * ++once lua require('start').start()]], true)
autocmd(
  'syntax_aucmds',
  [[Syntax * syn match extTodo "\<\(NOTE\|HACK\|BAD\|TODO\):\?" containedin=.*Comment.* | hi! link extTodo Todo]],
  true
)
autocmd('misc_aucmds', {
  [[BufWinEnter * checktime]],
  [[TextYankPost * silent! lua vim.highlight.on_yank()]],
  [[FileType qf set nobuflisted ]],
}, true)

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

