local M = {}

-- Simple keymaps shorthand
function M.nmap(keys, command, desc)
    local options = { noremap = true, silent = true, desc = desc }
    vim.keymap.set("n", keys, command, options)
end

function M.imap(keys, command, desc)
    local options = { noremap = true, silent = true, desc = desc }
    vim.keymap.set("i", keys, command, options)
end

-- Simple way to create augroups
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

-- Merge two tables
function M.merge(a, b)
    local first_table = a or {}
    local second_table = b or {}

    for k, v in pairs(second_table) do
        first_table[k] = v
    end

    return first_table
end

return M