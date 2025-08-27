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

map("n", "<C-p>", "<C-i>", { noremap = true, desc = "Jump forward in jumplist" })

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
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>dt", dap_python.test_method, { desc = "DAP near test" })
map("n", "<leader>du", dapui.toggle, { desc = "DAP UI toggle" })
map("n", "<leader>de", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "DAP eval under cursor" })
map("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
map("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
map("n", "<leader>do", dap.step_over, { desc = "DAP Step Over" })
map("n", "<leader>dr", dap.restart, { desc = "DAP Restart" })

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

-- Harpoon
map("n", "<leader>a", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon to file 1" })
map("n", "<leader>A", function()
  require("harpoon"):list():replace_at(1)
end, { desc = "Harpoon insert into file 1" })
map("n", "<leader>s", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon to file 2" })
map("n", "<leader>S", function()
  require("harpoon"):list():replace_at(2)
end, { desc = "Harpoon insert into file 2" })
-- map("n", "<leader>A", function()
--   require("harpoon"):list():add()
-- end, { desc = "Harpoon file" })
-- map("n", "<leader>a", function()
--   local harpoon = require "harpoon"
--   harpoon.ui:toggle_quick_menu(harpoon:list(), {
--     border = "rounded",
--     title_pos = "center",
--     title = { { " Harpoon ", "LazyH1" } },
--   })
--   vim.wo[harpoon.ui.win_id].signcolumn = "yes:1"
-- end, { desc = "Harpoon quick menu" })
