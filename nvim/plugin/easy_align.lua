local map = require('setup.utils').map

-- Keybindings
local options = {silent = true, noremap = false}
map({'x', 'n'}, 'ga', '<Plug>(EasyAlign)', options)
