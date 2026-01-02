return {
    -- 1. Customize Copilot Autocomplete
    {
        "zbirenbaum/copilot-cmp",
        enabled = false,
    },
    -- 2. Customize Copilot Chat (The Agent)
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            opts = {
                -- Make the chat window a small floating box near your cursor

                -- Define your custom Quick Actions here
                prompts = {
                    -- "create this function" / "optimize"
                    Refactor = {
                        prompt = "/COPILOT_GENERATE Refactor this code to be cleaner and more efficient.",
                    },
                    -- "add comments"
                    BetterNamings = {
                        prompt = "/COPILOT_GENERATE Rename variables and functions to be more descriptive.",
                    },
                    Documentation = {
                        prompt = "/COPILOT_GENERATE Add Doxygen/JSDoc documentation comments to the selected code.",
                    },
                    -- "Create a function" logic (Select empty lines or a signature)
                    GenerateFunc = {
                        prompt = "/COPILOT_GENERATE Create a function that does the following: ",
                    },
                },

                -- Keymaps to Accept/Reject changes
                mappings = {
                    -- This is the "Accept Diff" key
                    accept_diff = {
                        normal = "<C-y>",
                        insert = "<C-y>",
                    },
                    close = {
                        normal = "q",
                        insert = "<C-c>",
                    },
                },
            },

            -- Custom Keybinds for your workflow
            keys = {
                -- NEW: Generate Commit Message
                {
                    "<leader>gm",
                    function()
                        -- 1. Check if git is available to avoid errors
                        if vim.fn.executable("git") == 0 then
                            vim.notify("Git is not installed", vim.log.levels.ERROR)
                            return
                        end

                        -- 2. Ask Copilot to write the commit
                        require("CopilotChat").ask(
                            -- Prompt:
                            "Write a commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
                            {
                                selection = require("CopilotChat.select").gitdiff, -- Looks at staged changes
                                window = {
                                    layout = "float",
                                    relative = "cursor",
                                    width = 1,
                                    height = 0.4,
                                },
                            }
                        )
                    end,
                    desc = "Generate Commit Message",
                },
                -- 1. "Ask Inline": Visual Select -> Leader+ai -> Type "make this simpler"
                {
                    "<leader>ai",
                    function()
                        local input = vim.fn.input("Inline Edit: ")
                        if input ~= "" then
                            require("CopilotChat").ask(input, {
                                selection = require("CopilotChat.select").visual,
                            })
                        end
                    end,
                    desc = "Copilot Inline Edit",
                    mode = "x", -- Visual mode only
                },

                -- 2. Quick "Add Docs": Visual Select -> Leader+ad
                {
                    "<leader>ad",
                    "<cmd>CopilotChatDocumentation<cr>",
                    desc = "Add Docs/Comments",
                    mode = "x",
                },

                -- 3. Quick "Fix": Visual Select -> Leader+af
                {
                    "<leader>af",
                    "<cmd>CopilotChatFix<cr>",
                    desc = "Fix Code",
                    mode = "x",
                },

                -- 4. Quick "Refactor": Visual Select -> Leader+ar
                {
                    "<leader>ar",
                    "<cmd>CopilotChatRefactor<cr>",
                    desc = "Refactor Code",
                    mode = "x",
                },
            },
        },
    },
}
