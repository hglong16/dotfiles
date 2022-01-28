local u = require("utils")
local cmp = require("cmp")


cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    completion = {
        completeopt = "menu,menuone,noinsert",
        get_trigger_characters = function(trigger_characters)
            return vim.tbl_filter(function(char)
                return char ~= " " and char ~= "\t" and char ~= "\n"
            end, trigger_characters)
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
        ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort() }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                u.input("<plug>(vsnip-expand-or-jump)")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                u.input("<plug>(vsnip-jump-prev)")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sorting = {
    comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
  },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "vsnip", priority = 9999 },
    },
})
