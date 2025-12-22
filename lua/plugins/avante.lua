return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
        -- 1. Tell Avante to use Copilot
        provider = "copilot",
        auto_suggestions_provider = "copilot", -- Use Copilot for inline suggestions too

        -- 2. Configure Copilot specifically
        copilot = {
            -- You can usually use "gpt-4o" or "claude-3.5-sonnet" here depending on your GitHub subscription tier.
            -- If one doesn't work, try the other.
            model = "gpt-4o",

            -- Recommended settings for best results
            temperature = 0,
            max_tokens = 4096,
        },

        -- 3. Behavior settings
        behaviour = {
            auto_suggestions = false, -- Experimental - suggest code in normal mode
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = true,
        },

        -- 4. Windows setup (Sidebar width, etc.)
        windows = {
            position = "right",
            width = 30,
            sidebar_header = {
                align = "center",
                rounded = true,
            },
        },
    },

    -- 5. Dependencies (REQUIRED)
    build = "make", -- IMPORTANT: You must have `make` installed on your OS
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "hrsh7th/nvim-cmp", -- Optional: For autocomplete in the chat window
        "nvim-tree/nvim-web-devicons",
        "zbirenbaum/copilot.lua", -- You likely already have this
        {
            -- Support for rendering Markdown (Chat bubbles)
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
