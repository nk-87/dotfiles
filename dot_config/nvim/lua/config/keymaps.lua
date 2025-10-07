-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

map("n", "<leader>fo", function()
	Snacks.terminal.toggle("fish", { interactive = true })
end, { desc = "Floating Terminal (cwd)" })

map("n", "<c-.>", function()
	Snacks.terminal.toggle("fish", { interactive = true })
end, { desc = "Floating Terminal (cwd)" })

map("t", "<c-\\><c-\\>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
