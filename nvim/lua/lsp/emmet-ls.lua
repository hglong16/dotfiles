local M = {}
M.setup = function(on_attach, capabilities)
    require("lspconfig").emmet_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
