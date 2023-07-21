local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

helpers.nmap(
    "<leader>ff",
    ":Telescope find_files<cr>",
    "Telescope [f]ind [f]iles"
)

helpers.nmap(
    "<leader>fg",
    ":Telescope live_grep<cr>",
    "Telescope [f]ind [g]rep"
)

helpers.nmap(
    "<leader>fb",
    ":Telescope buffers<cr>",
    "Telescope [f]ind [b]uffers"
)

helpers.nmap(
    "<leader>fh",
    ":Telescope help_tags<cr>",
    "Telescope [f]ind [h]elp tags"
)
helpers.nmap(
    "<leader>fk",
    ":Telescope keymaps<cr>",
    "Telescope [f]ind [k]eymaps"
)
