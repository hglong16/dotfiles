local ts_cf = require 'nvim-treesitter.configs'
ts_cf.setup {
    ensure_installed = 'maintained',
    highlight = {
            enable = true,
            use_languagetree = true
        },
    autotag = { enable = true, },
    context_commentstring = { enable = true},
    indent = {enable = false},
    autopairs = {enable = true},
   rainbow = {
        enable = true,
        extended_mode = false,
    },
    refactor = {
        smart_rename = {enable = true, keymaps = {smart_rename = 'grr' }},
        highlight_definitions = { enable = true },


    },textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}
