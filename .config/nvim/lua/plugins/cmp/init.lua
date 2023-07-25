local ok, cmp = pcall(require, "cmp")

-- need to check cmp as it can be nil
if not ok then
    return
end

cmp.setup({
    completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
    },
    formatting = {
        format = require("plugins.lspkind.utils").add_lspkind_icons(),
    },
    snippet = {
        expand = function(args)
            local luasnip_ok, luasnip = pcall(require, "luasnip")

            if luasnip_ok then
                luasnip.lsp_expand(args.body)
            end
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if
                cmp.visible()
                and require("plugins.cmp.utils").has_words_before()
            then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "buffer", keyword_length = 5, group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "copilot", group_index = 2 },
    },
})
