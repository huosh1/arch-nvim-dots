return {
  { "echasnovski/mini.pairs",    version = false, config = true },
  { "echasnovski/mini.comment",  version = false, config = true },
  { "echasnovski/mini.surround", version = false, config = true },
  {
    "echasnovski/mini.trailspace",
    version = false,
    config = function()
      require("mini.trailspace").setup()
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() require("mini.trailspace").trim() end,
      })
    end,
  },
}
