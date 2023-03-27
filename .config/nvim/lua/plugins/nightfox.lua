local present, nightfox = pcall(require, "nightfox")

if not present then
    return
end

nightfox.setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
        },
    },
})

-- Change these to your prefered dark and light themes
local dark_theme = "nordfox"
local default_theme = dark_theme
local light_theme = "dawnfox"
local opts = { noremap = true, silent = true }
local themes = {
    "nightfox",
    "dawnfox",
    "dayfox",
    "duskfox",
    "nordfox",
    "terafox",
    "carbonfox",
}

-- Safely set theme with error handling
local set_theme = function(theme)
    local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)

    if ok then
        vim.notify("Theme set to: " .. theme)
    else
        vim.notify("Theme not found: " .. theme)
    end
end

-- Toggle between themes
local toggle_themes = function()
    local current_theme = vim.api.nvim_get_var("colors_name")
    local next_theme = ""
    local length = 0
    local position = 0

    -- Find current theme in themes table
    -- unfortunately no built in way to do this withour iterating
    for i, theme in ipairs(themes) do
        length = length + 1
        if theme == current_theme then
            position = i
        end
    end

    if position >= 1 and position ~= length then
        next_theme = themes[position + 1]
    else
        next_theme = themes[1]
    end

    set_theme(next_theme)
end

-- Toggle between light and dark theme
local toggle_lightning = function()
    local current_theme = vim.api.nvim_get_var("colors_name")

    if current_theme == dark_theme then
        set_theme(light_theme)
    else
        set_theme(dark_theme)
    end
end

vim.keymap.set("n", "<leader>tl", toggle_lightning, opts)
vim.keymap.set("n", "<leader>tt", toggle_themes, opts)

-- Set default theme
set_theme(default_theme)
