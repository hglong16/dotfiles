local nvim_lsp = require('nvim_lsp')
local lsp_status = require('lsp-status')

lsp_status.register_progress()

local function make_on_attach(config)
  return function(client)
    if config.before then
      config.before(client)
    end

    lsp_status.register_client(client.name)
    require('diagnostic').on_attach()
    require('completion').on_attach()
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_command('augroup lsp_aucmds')
    vim.api.nvim_command('au! * <buffer>')
    vim.api.nvim_command('augroup END')
    if client.resolved_capabilities.documentHighlightProvider then
      vim.api.nvim_command('augroup lsp_aucmds')
      vim.api.nvim_command('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('au User LspDiagnosticsChanged redrawstatus!')
      vim.api.nvim_command('au User LspMessageUpdate redrawstatus!')
      vim.api.nvim_command('augroup END')
    end

    if client.resolved_capabilities.documentSymbolProvider then
      vim.api.nvim_command('augroup lsp_aucmds')
      vim.api.nvim_command('au CursorHold <buffer> lua require("lsp-status").update_current_function()')
      vim.api.nvim_command('augroup END')
    end

    if config.after then
      config.after(client)
    end
  end
end

local servers = {
  bashls = {},
  clangd = {
    cmd = { 'clangd',
      '--background-index',
      '--clang-tidy',
      '--completion-style=bundled',
      '--header-insertion=iwyu',
      '--suggest-missing-includes'
    },
    callbacks = {
      ['textDocument/clangd.fileStatus'] = lsp_status.extension_callbacks.clangd['textDocument/clangd.fileStatus']
    }
  },
  html = {},
  jsonls = {},
  julials = {},
  ocamllsp = {},
  pyls_ms = {
    cmd = { 'mspyls' },
    callbacks = {
      ['python/setStatusBarMessage'] = lsp_status.extension_callbacks.pyls_ms["python/setStatusBarMessage"],
      ['python/reportProgress'] = lsp_status.extension_callbacks.pyls_ms["python/reportProgress"],
      ['python/beginProgress'] = lsp_status.extension_callbacks.pyls_ms["python/beginProgress"],
      ['python/endProgress'] = lsp_status.extension_callbacks.pyls_ms["python/endProgress"],
    }
  },
  rust_analyzer = {},
  sumneko_lua = {
    cmd = { 'lua-language-server' },
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        completion = {
          keywordSnippet = 'Disable'
        },
        runtime = {
          version = 'LuaJIT'
        }
      }
    }
  },
  texlab = {},
  vimls = {},
}

for server, config in pairs(servers) do
  config.on_attach = make_on_attach(config)
  nvim_lsp[server].setup(config)
end
