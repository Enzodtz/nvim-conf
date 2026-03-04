require("nvchad.configs.lspconfig").defaults()
local path_utils = require "utils.path"

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

vim.lsp.config["pyright"] = {
  settings = {
    python = {
      pythonPath = (function()
        -- Use cwd .venv/bin/python
        local cwd = vim.fn.getcwd()
        local local_venv = cwd .. "/.venv/bin/python"
        if path_utils.exists(local_venv) then
          return local_venv
        end

        -- Use $HOME/.venv
        local home = os.getenv "HOME"
        if home then
          local home_venv = home .. "/.venv/bin/python"
          if path_utils.exists(home_venv) then
            return home_venv
          end
        end

        -- Default to nil
        return nil
      end)(),
    },
  },
}

vim.lsp.enable(servers)
