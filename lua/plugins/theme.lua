return {
    -- 1. Tokyo Night (Installed, but not active default)
    {
        "folke/tokyonight.nvim",
        lazy = true, -- We lazy load it so it doesn't slow down startup
    },

    -- 2. Gruvbox (Installed, but not active default)
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
    },

    -- 3. Catppuccin (This is the ACTIVE one)
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load this first
        config = function()
            -- This triggers the theme
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
