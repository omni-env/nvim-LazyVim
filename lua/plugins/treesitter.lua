return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    keys = {
      -- 参数交换 (Swap) - 重构利器
      {
        "<leader>a",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        mode = "n",
        desc = "Swap argument with next",
      },
      {
        "<leader>A",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
        end,
        mode = "n",
        desc = "Swap argument with previous",
      },
    },
  },
}
