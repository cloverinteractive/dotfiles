local M = {}

function M.setup(options)
    for k, v in pairs(options) do
        M[k] = v
    end

    -- set default theme
    M.set_theme(M.default_theme)

  return M
end

-- Safely set theme with error handling
function M.set_theme(theme)
    ---@diagnostic disable-next-line: param-type-mismatch
    local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)

    if ok then
        vim.notify_once("Theme set to: " .. theme, vim.log.levels.INFO)
    else
        vim.notify_once("Theme not found: " .. theme, vim.log.levels.ERROR)
    end
end

-- Toggle between themes
function M.toggle_themes()
    local current_theme = vim.api.nvim_get_var("colors_name")
    local next_theme = ""
    local length = 0
    local position = 0

    -- Find current theme in themes table
    -- unfortunately no built in way to do this withour iterating
    for i, theme in ipairs(M.themes) do
        length = length + 1
        if theme == current_theme then
            position = i
        end
    end

    if position >= 1 and position ~= length then
        next_theme = M.themes[position + 1]
    else
        next_theme = M.themes[1]
    end

    M.set_theme(next_theme)
end

-- Toggle between light and dark theme
function M.toggle_lightning()
    local current_theme = vim.api.nvim_get_var("colors_name")

    if current_theme == M.dark_theme then
        M.set_theme(M.light_theme)
    else
        M.set_theme(M.dark_theme)
    end
end

return M
