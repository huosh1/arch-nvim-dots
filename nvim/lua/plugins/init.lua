return {
  -- Explorateur de fichiers (à gauche) avec un peu de transparence
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Icônes (facultatif). Si tu n'en veux pas, supprime cette ligne ET la clé 'filesystem.use_libuv_file_watcher'.
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 32,
          winblend = 20, -- transparence
        },
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
      })
      vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle left<cr>", { desc = "Explorer" })
    end,
  },

  -- Terminal togglable en split (vertical par défaut)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 40,
        direction = "vertical", -- "vertical" | "horizontal" | "float" | "tab"
        shade_terminals = false,
        start_in_insert = true,
      })
      -- Toggling rapide
      vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal (toggle)" })
      -- Un terminal dédié à droite
      vim.keymap.set("n", "<leader>tv", function()
        require("toggleterm").toggle(1, 40, nil, "vertical")
      end, { desc = "Terminal vertical" })
      -- Un terminal horizontal (si tu veux)
      vim.keymap.set("n", "<leader>th", function()
        require("toggleterm").toggle(2, 10, nil, "horizontal")
      end, { desc = "Terminal horizontal" })
      -- En mode terminal: échapper en Normal
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Normal mode (terminal)" })
    end,
  },
 {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",          -- variantes: "night", "storm", "moon", "day"
    transparent = true,       -- laisse le fond de ton terminal
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
 },
 }
