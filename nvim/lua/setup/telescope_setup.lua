local map = require('setup.utils').map

local silent = { silent = true }
-- Navigate buffers and repos
map('n', '<Leader><Tab>', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map('n', '<Leader>e', [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
map('n', '<Leader>p', [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map('n', '<Leader>o', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
map('n', '<Leader>b', [[<cmd>Telescope file_browser theme=get_dropdown<cr>]], silent)
map('n', '<Leader>f', [[<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<cr>]], silent)
map('n', '<Leader>9', [[<cmd>Telescope project theme=ivy<cr>]], silent)
map('n', '<Leader>r', [[<cmd>Telescope registers theme=get_ivy<cr>]], silent)
map('n', '<Leader>d', [[<cmd>Telescope diagnostics theme=get_ivy<cr>]], silent)
