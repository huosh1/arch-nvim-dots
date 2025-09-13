return {
  -- Treesitter : syntaxe/indent
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "vim", "bash", "python", "json", "yaml", "markdown", "c", "cpp" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },

  -- Mason + LSP
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "bashls", "lua_ls", "clangd" },
        automatic_installation = true,
      })
      local lsp = require("lspconfig")
      lsp.pyright.setup({})
      lsp.bashls.setup({})
      lsp.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
      lsp.clangd.setup({}) -- C/C++
    end,
  },
}
