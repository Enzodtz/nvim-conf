require "custom.library.concat_array"
require "custom.library.sys_is_wsl"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local sources = {
    -- c
    null_ls.builtins.formatting.clang_format,

    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
        local default_args = { "--python-version=3.11" }

        local Path = require "plenary.path"
        local venv = Path:new((vim.fn.getcwd():gsub("/", Path.path.sep)), ".venv")

        if venv:joinpath("bin"):is_dir() then
          venv = tostring(venv:joinpath("bin", "python3"))
        elseif venv:joinpath("Scripts"):is_dir() then
          venv = tostring(venv:joinpath("Scripts", "python.exe"))
        else
          return default_args
        end

        return ConcatArray(default_args, { "--python-executable", venv })
      end,
    }),
    null_ls.builtins.diagnostics.ruff,
  }

-- add latex source
if(SysIsWSL()) then
  local customLatexIndent = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "tex" },
      generator = null_ls.formatter({
          command = "latexindent.exe",
          args = { },
          to_stdin = true,
          from_stderr = true,
      }),
  }
  null_ls.register(customLatexIndent)
else
  table.insert(sources, null_ls.builtins.formatting.latexindent)
end

local opts = {
  sources = sources,
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
