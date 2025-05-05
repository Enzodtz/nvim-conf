require "custom.library.concat_array"
require "custom.library.sys_is_wsl"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local sources = {
    -- c
    null_ls.builtins.formatting.clang_format.with{
      filetypes = { "c" }
    },

    -- c#
    null_ls.builtins.formatting.csharpier,

    -- python
    --

    -- html, js, ts etc
    null_ls.builtins.formatting.prettier
  }

-- add latex source
local customLatexIndent = {
    method = null_ls.methods.FORMATTING,
    filetypes = { "tex" },
    generator = null_ls.formatter({
        command = "latexindent",
        args = { },
        to_stdin = true,
        from_stderr = true,
    }),
}
null_ls.register(customLatexIndent)

-- add ruff source
local ruffFormatter = {
    method = null_ls.methods.FORMATTING,
    filetypes = { "python" },
    generator = null_ls.formatter({
        command = "ruff",
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
        to_stdin = true,
    }),
}
null_ls.register(ruffFormatter)

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
