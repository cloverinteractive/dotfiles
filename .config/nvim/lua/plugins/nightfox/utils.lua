---@alias ThemeOptions { dark_theme: string, default_theme: string, light_theme: string, themes: string[] }

---@class EditorTheme
---@field dark_theme string default dark theme
---@field default_theme string default them
---@field light_theme string default light theme
---@field themes string[] full list of themes
local M = {
    dark_theme = "nordfox",
    default_theme = "nordfox",
    light_theme = "dawnfox",
    themes = {
        "nightfox",
        "dawnfox",
        "dayfox",
        "duskfox",
        "nordfox",
        "terafox",
        "carbonfox",
    },
}

--- Sets up the default, dark and light themes, and the list of available themes we want
--- to toggle between.
---@param self EditorTheme
---@param options? ThemeOptions
function M.setup(self, options)
    for k, v in pairs(options or {}) do
        self[k] = v
    end

    -- set default theme
    self.set_theme(self.default_theme)
end

--- Safely set theme with error handling
---@param theme string
function M.set_theme(theme)
    ---@diagnostic disable-next-line: param-type-mismatch
    local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)

    if ok then
        vim.notify_once("Theme set to: " .. theme, vim.log.levels.INFO)
    else
        vim.notify_once("Theme not found: " .. theme, vim.log.levels.ERROR)
    end
end

--- Toggle between themes
--- @param self EditorTheme
function M.toggle_themes(self)
    local current_theme = vim.api.nvim_get_var("colors_name")
    local next_theme = ""
    local length = 0
    local position = 0

    -- Find current theme in themes table
    -- unfortunately no built in way to do this withour iterating
    for i, theme in ipairs(self.themes) do
        length = length + 1
        if theme == current_theme then
            position = i
        end
    end

    if position >= 1 and position ~= length then
        next_theme = self.themes[position + 1]
    else
        next_theme = self.themes[1]
    end

    self.set_theme(next_theme)
end

--- Toggle between light and dark theme
--- @param self EditorTheme
function M.toggle_lightning(self)
    local current_theme = vim.api.nvim_get_var("colors_name")

    if current_theme == self.dark_theme then
        self.set_theme(self.light_theme)
    else
        self.set_theme(self.dark_theme)
    end
end

return M
