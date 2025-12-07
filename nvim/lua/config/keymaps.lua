-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- local del = vim.keymap.del

-- del("n", "<C-h>")
-- del("n", "<C-j>")
-- del("n", "<C-k>")
-- del("n", "<C-l>")

-- Remove LazyVim’s conflicting keymaps
-- for _, key in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>" }) do
-- 	pcall(vim.keymap.del, "n", key)
-- end

map("n", "<C-o>", ":SymbolsOutline<cr>", { desc = "Symbols Outline" })
map("n", "<C-Space>", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
map("n", "<C-n>", ":tabn<cr>", { desc = "Next Tab" })
map("n", "<C-p>", ":tabp<cr>", { desc = "Prev Tab" })
map("n", "``", "<Plug>(comment_toggle_linewise_current)")
map("v", "``", "<Plug>(comment_toggle_linewise_visual)")
