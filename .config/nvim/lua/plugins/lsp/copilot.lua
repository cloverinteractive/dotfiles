-- Use to enable/disable filetypes
vim.g.copilot_filetypes = { ["*"] = true, xml = false }
vim.g.copilot_assume_mapped = true

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
