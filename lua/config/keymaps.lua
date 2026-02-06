-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Map Leader (usually Space) + . to open the preview
vim.keymap.set({ "v", "n" }, "<leader>.", require("actions-preview").code_actions)
-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Copy relative path
vim.keymap.set("n", "<leader>cf", ':let @+ = expand("%")<CR>', { desc = "Copy filename" })
-- Copy absolute path
vim.keymap.set("n", "<leader>cF", ':let @+ = expand("%:p")<CR>', { desc = "Copy full path" })
-- Save with Cmd+S (macOS)
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Esc>:w<CR>", { desc = "Save file" })
