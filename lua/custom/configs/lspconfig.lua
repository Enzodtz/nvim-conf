local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

local omnisharp_extended = require("omnisharp_extended")
lspconfig.omnisharp.setup {
  cmd = { "omnisharp" },
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = omnisharp_extended.definition_handler,
    ["textDocument/typeDefinition"] = omnisharp_extended.type_definition_handler,
    ["textDocument/references"] = omnisharp_extended.references_handler,
    ["textDocument/implementation"] = omnisharp_extended.implementation_handler,
  },
}


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
