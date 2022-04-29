local lspconfig = require "lspconfig"
local util = lspconfig.util
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Autoformat
function autoformat(filetype)
  if filetype == "*.go" then
    cb = function()
      vim.lsp.buf.formatting_sync()
      OrgImports(1000)
    end
  else
    cb = vim.lsp.buf.formatting_sync
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = filetype,
    callback = cb
  })
end

-- Go
function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      -- staticcheck = true,
    },
  },
  capabilities = capabilities,
}

autoformat "*.go"

-- Terraform
lspconfig.terraformls.setup {
  cmd = {"terraform-ls", "serve"},
  filetypes = {"terraform", "tf"},
  root_dir = util.root_pattern(".terraform", ".git", ".tf"),
  capabilities = capabilities,
}

autoformat "*.tf"

-- JSON
lspconfig.jsonls.setup{ capabilities = capabilities }
autoformat "*.json"

-- Docker
lspconfig.dockerls.setup{ capabilities = capabilities }
autoformat "Dockerfile"
