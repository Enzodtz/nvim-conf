local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
        local Path = require "plenary.path"
        local venv = Path:new((vim.fn.getcwd():gsub("/", Path.path.sep)), ".venv")
        if venv:joinpath("bin"):is_dir() then
          venv = tostring(venv:joinpath("bin", "python"))
        else
          venv = tostring(venv:joinpath("Scripts", "python.exe"))
        end
          return { "--python-executable", venv }
      end,
    }),
    null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
