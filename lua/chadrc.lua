-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dark_sea",
  transparency = true,
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    -- enabled = false,
    theme = "vscode",
    -- TODO: add search count
  },
}

-- Sort diagnostics
vim.diagnostic.config {
  severity_sort = true,
}

return M
