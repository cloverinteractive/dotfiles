---@alias RHS
---| string
---| function

local M = {}

---@module "vim"
---@alias MapOpts string | vim.keymap.set.Opts options or description

--- Simple keymap helper
---@param mode string | string[]
---@param keys "n" | "i" | "t"
---@param command RHS
---@param opts? MapOpts
local function keymap(mode, keys, command, opts)
    local options = (type(opts) == "table" and opts)
        or { noremap = true, silent = true, desc = opts }

    vim.keymap.set(mode, keys, command, options)
end

--- Simple `n` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('n', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command RHS
---@param opts? MapOpts
function M.nmap(keys, command, opts)
    keymap("n", keys, command, opts)
end

--- Simple `i` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('i', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command RHS
---@param opts? MapOpts
function M.imap(keys, command, opts)
    keymap("i", keys, command, opts)
end

--- Simple `t` keymap shorthand basically a shorter version of:
---    `vim.keymap.set('t', keys, command, { noremap = true, silent = true, desc = desc })`
---@param keys string
---@param command RHS
---@param opts? MapOpts
function M.tmap(keys, command, opts)
    keymap("t", keys, command, opts)
end

--- Simple way to create augroups
---@param defintions table<string, table<string, string>>
function M.augroups(defintions)
    for group_name, definition in pairs(defintions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")

        for _, def in ipairs(definition) do
            local command = table.concat(
                vim.iter({ "autocmd", def }):flatten():totable(),
                " "
            )
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
