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
    use 'tpope/vim-surround'
    use {'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
    -- dev icons
    use 'kyazdani42/nvim-web-devicons' 
    -- blank line
    use 'lukas-reineke/indent-blankline.nvim'
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow' -- rainbow bracket
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- telescope
    use {
          'nvim-telescope/telescope.nvim',
           requires = { {'nvim-lua/plenary.nvim'} }
        }  
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }




end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
        end,
})


return plugins


