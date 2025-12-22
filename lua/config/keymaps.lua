-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Map Leader (usually Space) + . to open the preview
vim.keymap.set({ "v", "n" }, "<leader>.", require("actions-preview").code_actions)
