local u = require("utils")
local lsp = vim.lsp
local api = vim.api

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_lines = { prefix = "🔥" }, virtual_text = false, float = border_opts })

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- use lsp formatting if it's available (and if it's good)
-- otherwise, fall back to null-ls
local preferred_formatting_clients = { "denols", "eslint" }
local fallback_formatting_client = "null-ls"

local formatting = function(bufnr)
    bufnr = tonumber(bufnr) or api.nvim_get_current_buf()

    local selected_client
    for _, client in ipairs(lsp.buf_get_clients(bufnr)) do
        if vim.tbl_contains(preferred_formatting_clients, client.name) then
            selected_client = client
            break
        end

        if client.name == fallback_formatting_client then
            selected_client = client
        end
    end

    if not selected_client then
        return
    end

    local params = lsp.util.make_formatting_params()
    selected_client.request("textDocument/formatting", params, function(err, res)
        if err then
            local err_msg = type(err) == "string" and err or err.message
            return
        end

        if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
            return
        end

        if res then
            lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
            api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
            end)
        end
    end, bufnr)
end

global.lsp = {
    border_opts = border_opts,
    formatting = formatting,
}
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols")
u.command("LspAct", "Telescope lsp_code_actions")
u.command("LspRangeAct", "Telescope lsp_range_code_actions")

local on_attach = function(client, bufnr)
    -- commands
    u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
    u.lua_command("LspHover", "vim.lsp.buf.hover()")
    u.lua_command("LspRename", "vim.lsp.buf.rename()")
    u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
    u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
    u.lua_command("LspDiagLine", "vim.diagnostic.open_float(nil, global.lsp.border_opts)")
    u.lua_command("LspDiagQuickfix", "vim.diagnostic.setqflist()")
    u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")
    u.lua_command("LspRangeAct", "vim.lsp.buf.range_code_action()")

    -- bindings
    u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
    u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "n", "<Leader>q", ":LspDiagQuickfix<CR>")

    u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "n", "<leader>a", ":LspAct<CR>")
    u.buf_map(bufnr, "v", "<leader>a", "<Esc><cmd> LspRangeAct<CR>")
    u.buf_map(bufnr, "n", "<leader>m", "<cmd> LspFormatting<CR>")

    if client.supports_method("textDocument/formatting") then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePost <buffer> lua global.lsp.formatting(vim.fn.expand("<abuf>"))
        augroup END
        ]])
    end

    require("illuminate").on_attach(client)

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, server in ipairs({
    "bashls",
    -- "denols",
    "cssls",
    "clangd",
    "rls",
    "cmake",
    "eslint",
    "html",
    "tailwindcss",
    "emmet-ls",
    "pyright",
    "jsonls",
    "null-ls",
}) do
    require("lsp." .. server).setup(on_attach, capabilities)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
