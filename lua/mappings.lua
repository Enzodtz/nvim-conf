require "nvchad.mappings"
local telescope_builtin = require "telescope.builtin"
local map = vim.keymap.set
local dap = require "dap"
local dapui = require "dapui"
local dap_python = require "dap-python"

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
map("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent" })
map("n", "<S-Tab>", "<<", { noremap = true, silent = true, desc = "Dedent" })
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Dedent" })

-- Telescope
map("n", "<leader>fr", telescope_builtin.resume, { noremap = true, silent = true, desc = "Resume telescope" })
map(
  "n",
  "<leader>fs",
  telescope_builtin.lsp_dynamic_workspace_symbols,
  { noremap = true, silent = true, desc = "Find symbols" }
)

-- DAP
map("n", "<space>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<space>dt", dap_python.test_method, { desc = "DAP near test" })
map("n", "<space>du", dapui.toggle, { desc = "DAP UI toggle" })
map("n", "<space>de", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "DAP eval under cursor" })
map("n", "<space>dc", dap.continue, { desc = "DAP Continue" })
map("n", "<space>di", dap.step_into, { desc = "DAP Step Into" })
map("n", "<space>do", dap.step_over, { desc = "DAP Step Over" })
map("n", "<space>dr", dap.restart, { desc = "DAP Restart" })
