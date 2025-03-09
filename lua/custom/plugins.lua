local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",

        -- go
        "gopls",

        -- python
        "pyright",
        "mypy",
        "ruff",
        "black",

        -- typescript
        "typescript-language-server",

        -- c
        "clangd",
        "clang-format",

        -- c#
        "omnisharp",
        "csharpier",

        -- latex
        "texlab",
        "latexindent",

        -- js, html etc
        "prettier",
        "css-lsp",
        "html-lsp"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- webdev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- backend
        "python",
        "go",
        "gomod",
        "c_sharp",

        -- low level
        "c",

        -- infra
        "terraform",
        "hcl",

        -- others
        "latex"
      }
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh" },
    lazy = false
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    ft = {"python", "c", "h"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    opts = function ()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      }
    end
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim"
  }
}

return plugins


