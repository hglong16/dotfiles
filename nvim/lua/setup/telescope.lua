local telescope = require 'telescope'
telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
  },
  extensions = {
    frecency = { workspaces = { 
        ["conf"]    ="/User/hglong/.config",
        ["proj"]    ="/User/hglong/Projects",
        ["desktop"] ="/User/hglong/Desktop"
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      sort_lastused = true,
      previewer = false,
    },
    find_files = {
      find_command = {'fd', '--type', 'f', '--strip-cwd-prefix'}
    },
    file_browser = {
      layout_strategy = 'cursor',
    }
  },
}
}

-- Extensions
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'project'
