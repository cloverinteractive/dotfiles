local cmp_ok, cmp = pcall(require, "cmp")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not (cmp_lsp_ok and lspconfig_ok) then
	return
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Enable some language servers with the additional completion Capabilities
local servers = { "hls", "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

-- need to check cmp as it can be nil
if not (cmp_ok and cmp) then
	return
end

cmp.setup({
	completion = {
		-- Stops cmp suggestions dialog to pop up over copilot
		-- you can re-enable this and close the dialog wit h <C-e> if it doesn't bother you
		autocomplete = false,
	},
	experimental = {
		ghost_text = false, -- Stops cmp from using ghost text and overlapping with copilot
	},
	snippet = {
		expand = function(args)
			local luasnip_ok, luasnip = pcall(require, "luasnip")

			if luasnip_ok then
				luasnip.lsp_expand(args.body)
			end
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
	},
})
