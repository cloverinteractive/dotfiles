local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

local utils = require("plugins.nightfox.utils")

utils.setup(utils, {
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

helpers.nmap("<leader>tl", function()
    utils.toggle_lightning(utils)
end, "[T]oggle [L]ightning")

helpers.nmap("<leader>tt", function()
    utils.toggle_themes(utils)
end, "[T]oggle [T]hemes")
