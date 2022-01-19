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
    -- Startup time
    use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]] }
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
    -- telescope
    use {
          'nvim-telescope/telescope.nvim',
           requires = { {'nvim-lua/plenary.nvim'} }
        }  
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'ggandor/lightspeed.nvim'
    use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'nvim-telescope/telescope-project.nvim'
    use 'nvim-telescope/telescope-arecibo.nvim'
    -- Search
    use 'romainl/vim-cool'
    -- Color
    use 'norcalli/nvim-colorizer.lua'
    -- bufffer line
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- Completion and linting
    use {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp-status.nvim',
      'folke/trouble.nvim',
      'ray-x/lsp_signature.nvim',
      'kosayoda/nvim-lightbulb'
    }


end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
        end,
})


return plugins


