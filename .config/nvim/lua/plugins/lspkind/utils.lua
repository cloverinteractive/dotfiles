local ok, lspkind = pcall(require, "lspkind")

if not ok then
    return
end

--- @alias key string
--- @alias SymbolsMap { [key]: string }
--
--- @class Utils
local M = {}

--- @type SymbolsMap
local symbols = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

--- Format suggestions and add icons
---
---@return nil | unknown
function M.add_lspkind_icons()
    return lspkind.cmp_format({
        before = function(entry, vim_item)
            vim_item.kind = string.format("%s", symbols[vim_item.kind])
            vim_item.menu = ({
                buffer = "[Buffer]",
                luasnip = "[Snippet]",
                nvim_lsp = "[LSP]",
                path = "[path]",
            })[entry.source.name]

            return vim_item
        end,
    })
end

return M
