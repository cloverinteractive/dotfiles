local cmp_ok, cmp = pcall(require, "cmp")
local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if not (cmp_lsp_ok and lspconfig_ok and lspkind_ok) then
    return
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Enable some language servers with the additional completion Capabilities
local servers = { "hls", "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
    })
end

-- need to check cmp as it can be nil
if not (cmp_ok and cmp) then
    return
end

local kind_icons = {
    Copilot = "",
    Text = "",
    Method = "m",
    Function = "ƒ",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end

    local line, col = unpack(vim.api.nvim_win_get_cursor(0))

    return col ~= 0
        and vim.api
                .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
                :match("^%s*$")
            == nil
end

cmp.setup({
    completion = {
        -- Stops cmp suggestions dialog to pop up over copilot
        -- you can re-enable this and close the dialog wit h <C-e> if it doesn't bother you
        autocomplete = { cmp.TriggerEvent.TextChanged },
    },
    formatting = {
        format = lspkind.cmp_format({
            before = function(entry, vim_item)
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    luasnip = "[Snippet]",
                    nvim_lsp = "[LSP]",
                    path = "[path]",
                })[entry.source.name]

                return vim_item
            end,
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[path]",
            },
        }),
    },
    experimental = {
        ghost_text = false, -- Stops cmp from using ghost text and overlapping with copilot
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
            if cmp.visible() and has_words_before() then
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
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "copilot", group_index = 2 },
    },
})
