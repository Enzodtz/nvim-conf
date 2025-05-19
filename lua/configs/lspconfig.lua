require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- lua
  "lua_ls",

  -- rust
  "rust_analyzer",

  -- python
  "pyright",
}
vim.lsp.enable(servers)
