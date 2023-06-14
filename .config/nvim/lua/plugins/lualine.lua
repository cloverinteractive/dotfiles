local lualine_ok, lualine = pcall(require, "lualine")

if not lualine_ok then
    return
end

-- https://github.com/nvim-lualine/lualine.nvim#configuring-lualine-in-initvim
lualine.setup({})
