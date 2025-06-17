return {
  { "L3MON4D3/LuaSnip", enabled = false },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
        bashls = {},
      },
    },
  },
}
