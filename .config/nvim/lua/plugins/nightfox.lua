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

vim.cmd([[colorscheme nordfox]])
