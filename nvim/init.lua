vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true })


require('options')
require('plugins')

-- require('setup.autosession')
-- require('setup.bufferline')
-- require('setup.colorizer')
-- -- require('setup.dashboard')
-- require('setup.gitsigns')
-- require('setup.cmp')
-- require('setup.autopairs')
-- require('setup.toggleterm')
require('setup.treesitter')
require('setup.telescope')
require('setup.blankline')
-- require('setup.signature')
-- require('setup.luasnip/loaders/from_vscode').lazy_load()
-- require('setup.lspconfig')
-- require('setup.goto')
-- require('setip.goto')
-- require('setup.aeirla')
-- require('setup.rest')
--
--
-- require('lspicon')
-- require('lsp.emmet')
-- require('lsp.efm')
-- require('tree')
--
--
--
-- require('mappings')
-- require('highlights')
-- require('setup.dap')
-- require('autocommands')
