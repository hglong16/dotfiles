local ts_cf = require 'nvim-treesitter.configs'
ts_cf.setup {
    highlight = {
            enable = true,
        },
    autotag = { enable = true, },
    autopairs = {enable = true},
    context_commentstring = { enable = true}
    }
