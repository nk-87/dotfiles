local map = vim.api.nvim_set_keymap
local o = vim.o
local g = vim.g
local dict = {[vim.type_idx]=vim.types.dictionary}

-- General
o.number = true
o.laststatus = 2
o.clipboard = "unnamedplus"

-- Theme/Colors
o.termguicolors = true
o.background = "dark"

-- Indent
g.indent_guides_enable_on_vim_startup = 1
g.indent_guides_auto_colors = 0

-- Colors
g.lightline = { colorscheme = "dracula" }
vim.cmd [[colorscheme dracula]]

-- Dracula indent colors
vim.cmd [[autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2e303d   ctermbg=3]]
vim.cmd [[autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333643   ctermbg=4]]

-- Italic comments - doesn't work in Lua ¯\_(ツ)_/¯
-- cmd [[highlight Comment cterm=italic gui=italic]]

g.coq_settings = { auto_start = "shut-up" }

-- Keymap
local noremap = { noremap = true }

-- Don't copy to clipboard with D/d
map("n", "d", '"_d', noremap)
map("n", "D", '"_D', noremap)
map("v", "d", '"_d', noremap)

-- Spell check for markdown and text files
o.spelllang = "en"
vim.cmd [[autocmd FileType markdown setlocal spell]]
vim.cmd [[autocmd FileType text setlocal spell]]
g.spellfile = "~/.config/nvim/spell/en.utf-8.add"
