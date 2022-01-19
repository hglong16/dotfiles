local map = vim.api.nvim_set_keymap

local utils_core = erquire('utils.core')
local format = require('format')
local dap = require('dap')
-- local goto_preview = require('goto-preview')
local utils_dap = require('utils.dap')

local options = { noremap = true }
local cmd_options = { noremap, true, silent = true }

local function cmd_option(callback)
    return { noremap = true, silent = true, callback = callback }
end


vim.g.mapleader = ' '

map('i', 'jk', '<Esc>', options)
map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<Leader>s', [[:w<CR>]], cmd_options)

map('n', '<Leader>m', '', cmd_option(format.format))

-- Sidebar

map('n', '<Leader>v', '', cmd_option(require('rest-nvim').run))
