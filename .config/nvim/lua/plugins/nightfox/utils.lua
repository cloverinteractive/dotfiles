---@class EditorTheme
---@field dark_theme string Default dark theme
---@field default_theme string Default theme
---@field light_theme string Default light theme
---@field themes string[] Available themes
---@field theme_index table<string, integer> Lookup table for theme positions
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
    -- Pre-compute theme indices for O(1) lookup
    theme_index = {},
}

-- Initialize theme index table
for i, theme in ipairs(M.themes) do
    M.theme_index[theme] = i
end

--- Safely set theme with error handling
---@param theme string
function M.set_theme(theme)
    local ok = pcall(vim.cmd.colorscheme, theme)

    vim.notify_once(
        ok and ("Theme set to: " .. theme) or ("Theme not found: " .. theme),
        ok and vim.log.levels.INFO or vim.log.levels.ERROR
    )
end

--- Set up theme configuration
---@param self EditorTheme
---@param options? { dark_theme?: string, default_theme?: string, light_theme?: string, themes?: string[] }
function M.setup(self, options)
    if options then
        for k, v in pairs(options) do
            self[k] = v
        end

        -- Rebuild theme index if themes were updated
        if options.themes then
            self.theme_index = {}

            for i, theme in ipairs(self.themes) do
                self.theme_index[theme] = i
            end
        end
    end

    self.set_theme(self.default_theme)
end

--- Toggle between themes
---@param self EditorTheme
function M.toggle_themes(self)
    local current_theme = vim.g.colors_name
    local current_pos = self.theme_index[current_theme] or 0
    local next_theme = self.themes[current_pos + 1] or self.themes[1]

    self.set_theme(next_theme)
end

--- Toggle between light and dark theme
---@param self EditorTheme
function M.toggle_lightning(self)
    self.set_theme(
        vim.g.colors_name == self.dark_theme and self.light_theme
            or self.dark_theme
    )
end

return M
