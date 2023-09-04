--- @alias Command string | function

---@class Helpers
---@field nmap fun(keys: string, command: Command, desc?: string): nil
---@field imap fun(keys: string, command: Command, desc?: string): nil
---@field tmap fun(keys: string, command: Command, desc?: string): nil
---@field augroups fun(defintions: table<string, table<string, string>>): nil
---@field merge fun(a?: table, b?: table): table
local M = {}

--- Simple keymap helper
---@param mode string
---@param keys "n" | "i" | "t"
---@param command Command
---@param desc? string
local function keymap(mode, keys, command, desc)
    local options = { noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, keys, command, options)
end

--- Simple `n` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('n', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command Command
---@param desc? string
function M.nmap(keys, command, desc)
    keymap("n", keys, command, desc)
end

--- Simple `i` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('i', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command Command
---@param desc? string
function M.imap(keys, command, desc)
    keymap("i", keys, command, desc)
end

--- Simple `t` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('t', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command Command
---@param desc? string
function M.tmap(keys, command, desc)
    keymap("t", keys, command, desc)
end

--- Simple way to create augroups
---@param defintions table<string, table<string, string>>
function M.augroups(defintions)
    for group_name, definition in pairs(defintions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")

        for _, def in ipairs(definition) do
            local command =
                table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.api.nvim_command(command)
        end

        vim.api.nvim_command("augroup END")
    end
end

--- Shallowly merge two tables
---@param a? table
---@param b? table
function M.merge(a, b)
    local first_table = a or {}
    local second_table = b or {}

    for k, v in pairs(second_table) do
        first_table[k] = v
    end

    return first_table
end

return M
