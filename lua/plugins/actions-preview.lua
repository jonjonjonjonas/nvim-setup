return {
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            local hl = vim.api.nvim_set_hl
            -- Optional: specific highlighting to match your theme
            hl(0, "ActionsPreviewTitle", { fg = "#89b4fa", bg = "NONE", bold = true }) -- Blue title

            require("actions-preview").setup({
                -- detailed configuration for the "VS Code" look
                diff = {
                    algorithm = "patience",
                    ignore_whitespace = true,
                },
                telescope = {
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                        prompt_position = "top",
                        preview_cutoff = 20,
                        preview_height = 0.5,
                    },
                },
            })
        end,
    },
}
