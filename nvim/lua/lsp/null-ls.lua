local null_ls = require("null-ls")
local b = null_ls.builtins
local lspconfig = require("lspconfig")

local with_diagnostics_code = function(builtin)
  return builtin.with({
    diagnostics_format = "#{m} [#{c}]",
  })
end

local with_root_file = function(builtin, file)
  return builtin.with({
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  })
end

local sources = {
  -- formatting
  b.formatting.prettier,
  b.formatting.fish_indent,
  b.formatting.shfmt,
  b.formatting.rustfmt,
  b.formatting.yapf,
  b.formatting.stylua,
  b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal" } }),
  b.formatting.isort,
  with_root_file(b.formatting.stylua, "stylua.toml"),
  -- diagnostics
  with_root_file(b.diagnostics.selene, "selene.toml"),
  b.diagnostics.flake8,
  b.diagnostics.teal,
  b.diagnostics.eslint,
  b.diagnostics.tsc,
  with_diagnostics_code(b.diagnostics.shellcheck),
  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,
  -- hover
}
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
  end,
})

local M = {}
M.setup = function(on_attach)
  null_ls.setup({
    -- debug = true,
    sources = sources,
    on_attach = on_attach,
  })
end

return M
