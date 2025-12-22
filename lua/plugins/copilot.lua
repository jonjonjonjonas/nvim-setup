return {
    -- 1. Copilot (The "Ghost Text" Autocompletion)
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true, -- Suggest as you type
                    keymap = {
                        accept = "<Tab>", -- Use Tab to accept suggestions
                    },
                },
                panel = { enabled = false },
            })
        end,
    },
}
