return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    opts = {
        provider = "copilot",
        -- auto_suggestions_provider = "copilot",
        -- behaviour = {
        --     enable_cursor_planning_mode = true,
        -- },
        providers = {
            copilot = {
                model = "claude-3.7-sonnet",
            },
            ollama = {
                endpoint = "http://localhost:11434",
                model = "qwen2.5-coder:0.5b",
            },
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        "nvim-tree/nvim-web-devicons",
        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({})
            end,
        },
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
