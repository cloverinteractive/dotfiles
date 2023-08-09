local lualine_ok, lualine = pcall(require, "lualine")

if not lualine_ok then
    return
end

-- https://github.com/nvim-lualine/lualine.nvim#configuring-lualine-in-initvim
lualine.setup({
  lualine_x = {
    require("lazy.status").updates,
    require("lazy.status").has_updates,
    color = { fg = "#ff9e64" },
  }
})
