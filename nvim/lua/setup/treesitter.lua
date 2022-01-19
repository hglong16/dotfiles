local ts_cf = require 'nvim-treesitter.configs'
ts_cf.setup {
    ensure_installed = 'maintained',
    highlight = {
            enable = true,
        },
    autotag = { enable = true, },
    autopairs = {enable = true},
    context_commentstring = { enable = true},
    rainbow = {
        enable = true,
        extended_mode = false,
    },
    refactor = {
        smart_rename = {enable = true, keymaps = {smart_rename = 'grr' }},
        highlight_definitions = { enable = true },
        

    },
    textsubjects = {
        enables = true,
    },
}
