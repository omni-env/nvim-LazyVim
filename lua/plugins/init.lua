return {
  { "MagicDuck/grug-far.nvim", enabled = false },

  {
    "keaising/im-select.nvim",
    event = "InsertEnter",
    config = function()
      require("im_select").setup {}
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
      refresh_interval = 250,
    },
  },
}
