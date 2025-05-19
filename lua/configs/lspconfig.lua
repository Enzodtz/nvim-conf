require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- lua
  "lua_ls",

  -- rust
  "rust_analyzer",
}
vim.lsp.enable(servers)
