return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            -- Formatters
            "alejandra", -- Nix
            "autoflake", -- Python
            "beautysh", -- Shell
            "black", -- Python
            "cmakelang", -- CMake
            "elm-format", -- Elm
            "prettier", -- JavaScript, TypeScript, CSS, HTML, JSON, YAML, and more
            "prettierd", -- JavaScript, TypeScript, CSS, HTML, JSON, YAML, and more
            "purescript-tidy", -- PureScript
            "stylua", -- Lua
            "yamlfix", -- YAML
            "yamlfmt", -- YAML

            -- LSP servers
            "basedpyright", -- Python
            "bash-language-server", -- Bash
            "clangd", -- C, C++
            "cmake-language-server", -- CMake
            "copilot-language-server", -- Multiple languages
            "dhall-lsp", -- Dhall
            "django-template-lsp", -- Django templates
            "docker-compose-language-service", -- Docker Compose
            "dockerfile-language-server", -- Dockerfiles
            "elm-language-server", -- Elm
            "graphql-language-service-cli", -- GraphQL
            "lua-language-server", -- Lua
            "nil", -- Nix
            "prisma-language-server", -- Prisma
            "purescript-language-server", -- PureScript
            "pyright", -- Python
            "rescript-language-server", -- ReScript
            "rust-analyzer", -- Rust
            "tailwindcss-language-server", -- Tailwind CSS
            "typescript-language-server", -- TypeScript, JavaScript
            "yaml-language-server", -- YAML

            -- Linters and other tools
            "eslint_d", -- JavaScript, TypeScript
            "flake8", -- Python
            "mmdc", -- Mermaid
            "vacuum", -- OpenAPI
            "yamllint", -- YAML
        },
    },
}
