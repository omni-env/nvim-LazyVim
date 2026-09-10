return {
  {
    {
      "folke/flash.nvim",
      keys = {
        -- disable the default flash keymap
        { "s", mode = { "n", "x", "o" }, false },
      },
    },
    {
      "rainzm/flash-zh.nvim",
      dependencies = "folke/flash.nvim",
      event = "VeryLazy",
      keys = {
        {
          "s",
          function()
            require("flash-zh").jump {
              chinese_only = false,
            }
          end,
          mode = { "n", "x", "o" },
          desc = "Flash with Chinese support",
        },
      },
    },
  },
}
