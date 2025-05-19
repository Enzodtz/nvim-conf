require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- lua
  "lua_ls",

  -- rust
  "rust_analyzer",

  -- python
  "pyright",

  -- markdown
  "marksman",
}
vim.lsp.enable(servers)
