local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use {'~/projects/personal/packer.nvim', opt = true}

  -- Async building & commands
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Registers
  use 'junegunn/vim-peekaboo'

  -- Marks
  use 'kshenoy/vim-signature'

  -- Buffer management
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}

  -- Movement
  use {'chaoren/vim-wordmotion', 'justinmk/vim-sneak'}
  -- use { 'unblevable/quick-scope', opt = true }

  -- Quickfix
  use {'Olical/vim-enmasse', cmd = 'EnMasse'}

  -- Grepping
  use {'mhinz/vim-grepper', cmd = 'Grepper'}

  -- Indentation tracking
  use 'yggdroot/indentLine'

  -- Commenting
  use 'tomtom/tcomment_vim'
  -- use 'tyru/caw.vim'

  -- Wrapping/delimiters
  use {
    'machakann/vim-sandwich', {'andymass/vim-matchup', event = 'VimEnter *'}, '9mm/vim-closer',
    'tpope/vim-endwise'
  }

  -- Search
  use 'romainl/vim-cool'

  -- Pattern preview
  -- use { 'markonm/traces.vim' }

  -- Prettification
  use 'junegunn/vim-easy-align'
  -- TODO: Only load this for filetypes where LSP doesn't provide formatting
  use {'sbdchd/neoformat', cmd = 'Neoformat'}

  -- Text objects
  use 'wellle/targets.vim'

  -- Search
  use {
    {'yuki-ycino/fzf-preview.vim', run = 'npm install', opt = false, disable = true},
    'junegunn/fzf.vim',
    {'nvim-lua/telescope.nvim', opt = true }
  }

  -- Project Management/Sessions
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = {{'tpope/vim-obsession', cmd = 'Prosession'}}
  }

  -- REPL
  use {'hkupty/iron.nvim', cmd = {'IronRepl', 'IronWatchCurrentFile', 'IronSend'}}

  -- Undo tree
  use {'mbbill/undotree', cmd = 'UndotreeToggle'}

  -- Git
  use {'mhinz/vim-signify', {'tpope/vim-fugitive', cmd = {'Gpull', 'Gpush', 'Gstatus'}}}

  -- Terminal
  use 'voldikss/vim-floaterm'

  -- Completion and linting
  use {
    'neovim/nvim-lspconfig',
    '~/projects/personal/lsp-status.nvim',
    {
      {'haorenW1025/completion-nvim', event = 'InsertEnter *', config = function()
        local completion = require('completion')
        completion.addCompletionSource('vimtex', require('vimtex').complete_item)
        completion.addCompletionSource('wiki', require('wiki').complete_item)

        vim.cmd [[ augroup lsp_aucmds ]]
        vim.cmd [[ au BufEnter * lua require('completion').on_attach() ]]
        vim.cmd [[ augroup END ]]

        completion.on_attach()
        vim.cmd [[ doautoall FileType ]]
      end,
      requires = {
        {'hrsh7th/vim-vsnip', event = 'InsertEnter *'},
        {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter *'},
        {'https://gitlab.com/HiPhish/completion-nvim-vlime', after = {'completion-nvim', 'vlime'}},
      }
    },
    'haorenW1025/diagnostic-nvim',
    {'nvim-treesitter/completion-treesitter', opt = true},
    {'nvim-treesitter/nvim-treesitter', config = 'require("treesitter")'}
  }
}

  use {'liuchengxu/vista.vim', cmd = 'Vista'}
  use '~/projects/personal/hover.nvim'

  -- Debugger
  use {'mfussenegger/nvim-dap', opt = true}
  use {
    'puremourning/vimspector',
    setup = function() vim.g.vimspector_enable_mappings = 'HUMAN' end,
  }

  -- Linting
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = function() vim.cmd [[ ALEEnable ]] end
  }

  -- Language multipack
  use 'sheerun/vim-polyglot'

  -- Better Lua highlighting
  use 'euclidianAce/BetterLua.vim'

  -- Better Lua development for Neovim
  use 'tjdevries/nlua.nvim'

  -- Path navigation
  use 'justinmk/vim-dirvish'
  use 'kristijanhusak/vim-dirvish-git'

  -- Clojure/Lisps/Scheme
  local sexp_filetypes = {'clojure', 'lisp', 'scheme', 'racket', 'jbuild', 'fennel', 'pddl'}
  use {
    'guns/vim-sexp',
    ft = sexp_filetypes,
    config = function() vim.cmd [[ doautoall sexp_filetypes Filetype ]] end
  }

  use {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = sexp_filetypes,
    config = function()
      vim.cmd [[ doautoall sexp_mappings_for_regular_people Filetype ]]
    end
  }

  use {'vlime/vlime', rtp = 'vim/', ft = {'lisp'}}
  use {'Olical/conjure', ft = {'clojure', 'fennel'}}

  use {'eraserhd/parinfer-rust', ft = sexp_filetypes, run = 'cargo build --release'}

  -- LaTeX
  use 'lervag/vimtex'

  -- Meson
  use 'igankevich/mesonic'

  -- PDDL
  use 'PontusPersson/pddl.vim'

  -- Profiling
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}

  -- Highlight colors
  use 'norcalli/nvim-colorizer.lua'

  -- Lua development
  use {'rafcamlet/nvim-luapad', ft = 'lua'}

  -- Color scheme
  use '~/projects/personal/vim-nazgul'
  -- use 'chriskempson/base16-vim'
  -- use 'hardselius/warlock'
  -- use 'arzg/vim-substrata'
  -- use {'tjdevries/colorbuddy.vim', opt = true}

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    config = 'vim.cmd [[ doautocmd BufEnter ]]',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  -- Wiki
  use {
    'lervag/wiki.vim',
    event = {'BufNewFile ~/gdrive/notes/*.md', 'BufRead ~/gdrive/notes/*.md'},
    cmd = {'WikiJournal', 'WikiOpen'}
  }

  -- Notes
  use '~/projects/personal/pdf-scribe.nvim'

  -- Tasks
  use '~/projects/personal/import-todoist.nvim'
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
