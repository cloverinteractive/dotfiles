---@alias KeyCommand string | function
---@alias KeyOpts { desc?: string, silent?: boolean, noremap?: boolean }

local M = {}

--- Create a keymap with sensible defaults
---@param mode string | string[]
---@param keys string
---@param command KeyCommand
---@param opts? string | KeyOpts
local function keymap(mode, keys, command, opts)
    local options = type(opts) == "table" and opts or { desc = opts }
    options.noremap = options.noremap ~= false
    options.silent = options.silent ~= false

    vim.keymap.set(mode, keys, command, options)
end

--- Map keys in normal mode
---@param keys string
---@param command KeyCommand
---@param opts? string | KeyOpts
function M.nmap(keys, command, opts)
    keymap("n", keys, command, opts)
end

--- Map keys in insert mode
---@param keys string
---@param command KeyCommand
---@param opts? string | KeyOpts
function M.imap(keys, command, opts)
    keymap("i", keys, command, opts)
end

--- Map keys in terminal mode
---@param keys string
---@param command KeyCommand
---@param opts? string | KeyOpts
function M.tmap(keys, command, opts)
    keymap("t", keys, command, opts)
end

--- Map keys in visual mode
---@param keys string
---@param command KeyCommand
---@param opts? string | KeyOpts
function M.vmap(keys, command, opts)
    keymap("v", keys, command, opts)
end

--- Create autocommand groups
---@param definitions table<string, string[][]>
function M.augroups(definitions)
    for group_name, definition in pairs(definitions) do
        local group = vim.api.nvim_create_augroup(group_name, { clear = true })

        for _, def in ipairs(definition) do
            vim.api.nvim_create_autocmd(def[1], {
                group = group,
                pattern = def[2],
                command = def[3],
            })
        end
    end
end

--- Merge two tables
---@param target? table
---@param source? table
---@return table
function M.merge(target, source)
    return vim.tbl_extend("force", target or {}, source or {})
end

return M
