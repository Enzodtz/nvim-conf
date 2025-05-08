require "custom.library.highlighted_foldtext"

local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext=[[luaeval('HighlightedFoldtext')()]]
opt.fillchars="fold: "
-- opt.foldtext = 'lua.vim.treeesitter.foldtext()'
opt.foldenable = false

-- Treat axaml as xml
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.axaml",
  command = "set filetype=xml"
})

---@type ChadrcConfig 
 local M = {
  mappings = {
    ["utils"] = {
      n = {
        ["<A-m>"] = {
          ":%s/\\r//g<CR>",
          "Remove ^m characters from buffer"
        }
      }
    }
  }
}

-- Treat ejs files as html files
vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')

-- Sort diagnostics
vim.diagnostic.config({
  severity_sort = true,
})

 M.ui = {
  theme = 'catppuccin',
  transparency = true,
}
 M.plugins = "custom.plugins"
 return M
