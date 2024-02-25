local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "lua-language-server",

        -- python
        "pyright",
        "mypy",
        "ruff",
        "black",

        -- typescript
        "typescript-language-server",

        -- c
        "clangd",
        "clang-format"
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

        -- low level
        "c",

        -- infra
        "terraform"
      }
    }
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
}

return plugins


