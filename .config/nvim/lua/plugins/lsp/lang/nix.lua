local util = require("lspconfig/util")

return {
    cmd = { "nil" },
    filetypes = { "nix" },
    single_file_support = true,
    root_dir = util.root_pattern("flake.nix", ".git"),
}
