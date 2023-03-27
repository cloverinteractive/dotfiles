local telescope_ok, telescope = pcall(require, "telescope")

if not telescope_ok then
    return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)

telescope.setup({})
