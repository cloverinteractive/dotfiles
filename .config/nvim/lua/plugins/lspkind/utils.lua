local ok, lspkind = pcall(require, "lspkind")

if not ok then
    return
end

--- @alias SymbolMap { [key: string]: string }
--
--- @class Utils
--- @field add_lspkind_icons fun(): nil | unknown
local M = {}

--- @type SymbolMap
local symbols = {
    Copilot = "",
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
                copilot = "[Copilot]",
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
