return require("packer").startup(function(use)

  -- Packer
  use { "wbthomason/packer.nvim" }

  -- Themes
  use { "dracula/vim", as = "dracula" }
  use "lifepillar/vim-solarized8"
  use "itchyny/lightline.vim"
  use "NLKNguyen/papercolor-theme"
  use "nathanaelkane/vim-indent-guides"
  use "p00f/nvim-ts-rainbow"

  -- Syntax/Highlighting/Language
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "tpope/vim-markdown"
  use "towolf/vim-helm"
  use "hashivim/vim-terraform"
  use "ziglang/zig.vim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  }
  -- use "williamboman/nvim-lsp-installer"

  -- Misc
  use "tpope/vim-surround"
  use "lambdalisue/suda.vim"
  use "lilydjwg/colorizer"

end)
