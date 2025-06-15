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

  -- javascript
  "ts_ls",

  -- c / cpp
  "clangd",
}
vim.lsp.enable(servers)
