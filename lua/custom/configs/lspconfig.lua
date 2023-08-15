local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "tsserver", "emmet_ls", "cssmodules_ls" }
-- local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


lspconfig.volar.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'vue'}
}
--
-- lspconfig.volar.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {'css', 'less', 'sass'}
-- }

lspconfig.eslint.setup{
  on_attach = function(client, bufnr)
    on_attach()
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  codeActionOnSave = {
    enable = true,
    mode = "all"
  },
  capabilities = capabilities,
}
