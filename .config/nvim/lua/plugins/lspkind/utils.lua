--- @alias SymbolMap { [key: string]: string }
--
--- @class Utils
--- @field add_lspkind_icons fun(): nil | unknown
local M = {}

--- @type SymbolMap
local symbols = {
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

--- Format suggestions and add icons
---
---@return nil | unknown
function M.add_lspkind_icons()
    local ok, lspkind = pcall(require, "lspkind")

    if ok then
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
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[path]",
            },
        })
    end
end

return M
