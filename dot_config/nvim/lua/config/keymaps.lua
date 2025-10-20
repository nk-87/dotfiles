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

map("t", "<c-w>h", "<c-\\><c-n>:wincmd h<cr>", { desc = "Go to left window" })
map("t", "<c-w>j", "<c-\\><c-n>:wincmd j<cr>", { desc = "Go to bottom window" })
map("t", "<c-w>k", "<c-\\><c-n>:wincmd k<cr>", { desc = "Go to top window" })
map("t", "<c-w>l", "<c-\\><c-n>:wincmd l<cr>", { desc = "Go to right window" })

map("n", "<c-d-h>", "<c-w>h", { desc = "Go to left window" })
map("n", "<c-d-j>", "<c-w>j", { desc = "Go to bottom window" })
map("n", "<c-d-k>", "<c-w>k", { desc = "Go to top window" })
map("n", "<c-d-l>", "<c-w>l", { desc = "Go to right window" })
