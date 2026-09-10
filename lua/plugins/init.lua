return {
  { "folke/todo-comments.nvim", enabled = false },

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
}
