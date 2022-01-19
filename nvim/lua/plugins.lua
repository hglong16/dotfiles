local packer = nil
local function init()
    if packer == nil then
        packer = require 'packer'
        packer.init { disable_commands = true }
    end
    
    local use = packer.use
    packer.reset()

    -- Packer and basic
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'tpope/vim-commentary'
    -- dev icons
    use 'kyazdani42/nvim-web-devicons' 
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'



end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
        end,
})


return plugins


