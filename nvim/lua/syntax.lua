local o = vim.o
local g = vim.g

-- Misc
o.syntax = "enable"
vim.cmd [[filetype plugin indent on]]

-- Default indents
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.breakindent = true

local formatoptions = { "c", "r", "o" }
for i, fo in ipairs(formatoptions) do
  vim.opt.formatoptions:remove(fo)
end

-- Language specific indents
local filetypes = {
  go = {
    ts = 4,
    sw = 4,
    et = false,
  },
  python = {
    ts = 4,
    sw = 4,
    et = true,
  },
}

for filetype, options in pairs(filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      o.expandtab = options.et
      o.tabstop = options.ts
      o.shiftwidth = options.sw
    end,
  })
end

-- Keep colors consistent between tree-sitter and vim-helm for yaml
vim.cmd [[
  augroup theming
    au!
    au BufEnter *.{yaml,yml} :hi TSField guifg=#8be9fd
    au BufEnter *.{yaml,yml} :hi TSPunctDelimiter guifg=#ff79c6
  augroup END
]]
