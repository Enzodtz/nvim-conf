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
}
vim.lsp.enable(servers)
