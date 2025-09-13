return {
  -- Mason doit être initialisé en premier
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Installe automatiquement les binaires (via Mason)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      -- Assure un refresh du registry avant de résoudre les packages
      local registry = require("mason-registry")
      if not registry.refresh then
        -- anciennes versions n’exposent pas refresh (safe guard)
      else
        registry.refresh(function() end)
      end

      require("mason-tool-installer").setup({
        ensure_installed = {
          "black",        -- Python
          "isort",        -- Python
          "stylua",       -- Lua
          "shfmt",        -- Shell
          "clang-format", -- C/C++
          "jq",           -- JSON
          "prettier",     -- YAML/Markdown/etc (remplace yamlfmt)
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },

  -- Conform : format on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_on_save = { timeout_ms = 1500, lsp_fallback = true },
      formatters_by_ft = {
        python = { "black", "isort" },
        lua    = { "stylua" },
        sh     = { "shfmt" },
        json   = { "jq" },
        yaml   = { "prettier" },
        markdown = { "prettier" },
        c      = { "clang-format" },
        cpp    = { "clang-format" },
      },
    },
    config = function(_, opts) require("conform").setup(opts) end,
  },
}
