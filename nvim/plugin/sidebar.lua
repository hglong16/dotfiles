local sidebar = require "sidebar-nvim"
local utils = require("setup.utils")

sidebar.setup({
  disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "right",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = {
    "files",
    "todos",
    "diagnostics",
    "symbols"                                                            },
    section_separator = "-----",
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
                                                                         },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" }} },
    ["todos"] =         { icon = "",
    ignored_paths = { "~"                                                }, },
    disable_closing_prompt = false
})
map('n', '<leader>n', '<cmd>SidebarNvimFocus<cr>')
