local M = {}

-- Simple keymaps shorthand
function M.nmap(keys, command, desc)
    local options = { noremap = true, silent = true, desc = desc }
    vim.keymap.set("n", keys, command, options)
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

return M
