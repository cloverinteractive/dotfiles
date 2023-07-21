local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local utils = require("plugins.nightfox.utils").setup({
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
})

helpers.nmap("<leader>tl", utils.toggle_lightning, "[T]oggle [L]ightning")
helpers.nmap("<leader>tt", utils.toggle_themes, "[T]oggle [T]hemes")
