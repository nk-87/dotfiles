require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "go",
    "zig",
    "rust",
    "typescript",
    "javascript",
    "python",
    "bash",
    "lua",
    "vim",
    "json",
    "dockerfile",
    "html",
    "css",
    "yaml",
    "hcl",
    "toml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      "#ff6188",
      "#a9dc76",
      "#ab9df2",
      "#fc9867",
      "#ffd866",
      "#78dce8",
    }
  }
}
