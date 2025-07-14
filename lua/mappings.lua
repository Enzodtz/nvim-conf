require "nvchad.mappings"

local telescope_builtin = require "telescope.builtin"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>e", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })

map("n", "K", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "LSP Hover" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code action" })

-- Tab to indent
map("n", "<Tab>", ">>", { noremap = true, silent = true, desc = "Indent" })
map("v", "<Tab>", ">gv", { noremap = true, silent = true })
map("n", "<S-Tab>", "<<", { noremap = true, silent = true })
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Telescope resume
map("n", "<leader>fr", telescope_builtin.resume, { noremap = true, silent = true })
-- Telescope symbols
map("n", "<leader>fs", telescope_builtin.lsp_dynamic_workspace_symbols, { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
