require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>e", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
