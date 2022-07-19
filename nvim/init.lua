-- Install packer
require("impatient")
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])
local config = function(name)
  return string.format("require('%s')", name)
end

local use = require("packer").use
require("packer").startup(function()
  use("wbthomason/packer.nvim") -- Package manager
  use("tpope/vim-fugitive") -- Git commands in nvim
  use("tpope/vim-surround") -- Fugitive-companion to interact with github
  use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
  use("ludovicchabant/vim-gutentags") -- Automatic tags management
  use("knubie/vim-kitty-navigator")
  use("folke/todo-comments.nvim")
  use("lewis6991/impatient.nvim")
  use({ "max397574/better-escape.nvim" })
  use("stevearc/dressing.nvim")
  use("lewis6991/spellsitter.nvim")
  use("karb94/neoscroll.nvim")
  -- indent for python
  use("Vimjas/vim-python-pep8-indent")
  -- tree symbol
  use("simrat39/symbols-outline.nvim")
  -- unstable

  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
  })
  -- UI to select things (files, grep results, open buffers...)
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-project.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- theme
  use("projekt0n/github-nvim-theme") -- Theme inspired by Atom
  use("rebelot/kanagawa.nvim")
  use("nvim-lualine/lualine.nvim") -- Fancier statusline

  -- Add indentation guides even on blank lines
  use("lukas-reineke/indent-blankline.nvim")

  -- Add git related info in the signs columns and popups
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("kdheepak/lazygit.nvim")

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use("nvim-treesitter/nvim-treesitter")

  -- Additional textobjects for treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } })
  -- nvim lsp
  use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
  use("williamboman/nvim-lsp-installer")
  use("folke/lua-dev.nvim") -- better sumneko_lua settings
  use("b0o/schemastore.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use({ "RRethy/vim-illuminate", config = require("plugins/illuminate") })
  --   cmp
  use({ "hrsh7th/vim-vsnip", config = config("plugins.vsnip") })
  use({
    "hrsh7th/nvim-cmp", -- completion
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-under-comparator",
    },
    config = config("plugins.cmp"),
  })
  use({
    "windwp/nvim-autopairs", -- autocomplete pairs
    config = config("plugins.autopairs"),
    wants = "nvim-cmp",
  })
  -- Hoang Long add
  use("nathom/filetype.nvim")
  use("wellle/targets.vim")
  use("ggandor/lightspeed.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("junegunn/vim-easy-align")
  use("romgrk/barbar.nvim")
  use("norcalli/nvim-colorizer.lua")
  use {
    'ldelossa/gh.nvim',
    requires = { { 'ldelossa/litee.nvim' } }
  }
  -- Lua
  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = { 'nvim-treesitter' }, -- or require if not used so far
    after = { 'completion-nvim' } -- if a completion plugin is using tabs load it before
  }
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  }
end)

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "│·",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  space = "·",
  eol = "↴",
}

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.spell = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
vim.opt.autoindent = true
vim.opt.scrolloff = 15
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.clipboard = "unnamed"

-- symbon outline
vim.g.symbols_outline = {
  width = 27,
  auto_close = true,
  auto_preview = false,
}

--Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme kanagawa]])
vim.cmd([[hi Pmenu guibg='NONE']])

require("colorizer").setup({
  "*",
  c = { rgb_fn = true },
  python = { rgb_fn = true },
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

--Set statusbar
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "onedark",
    component_separators = "",
    section_separators = "",
  },
})

--Enable Comment.nvim
require("Comment").setup()
-- vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", [[<c-\><c-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>w", [[<cmd>w<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>rr", [[<Plug>RestNvim]], { noremap = true, silent = true })
-- lightspeed omni
vim.cmd([[nmap <expr> s reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_omni_s" : "s"]])
-- Nvim tree
require("nvim-tree").setup({})
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { silent = true })
--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gkzz' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gjzz' : 'j'", { noremap = true, expr = true, silent = true })

vim.keymap.set('n', '*', '*N', { silent = true })
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- always start in insert mode
vim.cmd("set laststatus=3")
vim.cmd("autocmd TermOpen * startinsert")
-- disable line numbers
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_current_context_start = true

-- Gitsigns
require("gitsigns").setup({
  signs = {
    add = { hl = "GreenSign", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "BlueSign", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "RedSign", text = "│", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "RedSign", text = "│", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "PurpleSign", text = "│", numhl = "GitSignsChangeNr" },
  },
  keymaps = {},
})

-- Telescope
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    layout_strategy = "flex",
    scroll_strategy = "cycle",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
  picker = {
    lsp_references = { theme = "ivy" },
    lsp_code_actions = { theme = "get_ivy" },
    lsp_definitions = { theme = "ivy" },
    lsp_implementations = { theme = "ivy" },
    tags = { theme = "ivy" },
    buffers = {
      sort_lastused = true,
      previewer = false,
    },
  },
})

-- Enable telescope fzf native
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

--Add leader shortcuts
vim.api.nvim_set_keymap(
  "n",
  "<leader><tab>",
  [[<cmd>lua require('telescope.builtin').buffers() theme=get_ivy<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  [[<cmd>Telescope find_files theme=get_dropdown<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>f",
  [[<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sh",
  [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>st", [[<cmd>Telescope tags theme=get_ivy<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  [[<cmd>Telescope live_grep theme=get_dropdown<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ss",
  [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true}<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>?",
  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sg",
  [[<cmd>Telescope git_commits theme=get_dropdown<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  [[<cmd>Telescope file_browser theme=get_dropdown<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>9",
  [[<cmd>Telescope project theme=get_ivy<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sr",
  [[<cmd>Telescope registers theme=get_ivy<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader><space>", [[<cmd>SymbolsOutline<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gg", [[<cmd>LazyGit<cr>]], { noremap = true, silent = true })

-- Treesitter configuration
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
  install_info = {
    url = "https://github.com/milisims/tree-sitter-org",
    revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "org",
}
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal) -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  autopairs = { enable = true },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})

global = {}
require("lsp")
require("cmp")

-- Lua
require("todo-comments").setup({})
require("better_escape").setup({
  mapping = { "jk" },
})
require("spellsitter").setup()

require("neoscroll").setup()

vim.api.nvim_set_keymap("n", "<C-h>", [[<cmd>KittyNavigateLeft<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", [[<cmd>KittyNavigateDown<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", [[<cmd>KittyNavigateUp<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", [[<cmd>KittyNavigateRight<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", [[<cmd>wincmd h<CR> ]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", [[wincmd j<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", [[<cmd>wincmd k<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", [[<cmd>wincmd l<cr>]], { noremap = true, silent = true })

-- gh.nvim config
require('litee.lib').setup({
  -- this is where you configure details about your panel, such as
  -- whether it toggles on the left, right, top, or bottom.
  -- leaving this blank will use the defaults.
  -- reminder: gh.nvim uses litee.lib to implement core portions of its UI.
})
require('litee.gh').setup({
  -- this is where you configure details about gh.nvim directly relating
  -- to GitHub integration.
})

