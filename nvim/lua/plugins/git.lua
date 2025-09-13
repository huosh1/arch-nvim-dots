return {
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = false },
    config = function(_, opts) require("gitsigns").setup(opts) end,
  },
}
