return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "powershell",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
      -- 参数交换 (Swap) - 重构利器
      {
        "<leader>a",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
        end,
        mode = "n",
        desc = "Swap argument with next",
      },
      {
        "<leader>A",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
        end,
        mode = "n",
        desc = "Swap argument with previous",
      },
      -- 增强重复跳转 (Repeatable Move)
      -- 让你在使用 `]f` 跳转后，可以按 `\` 继续向下跳，按 `|` 向上跳
      {
        "\\",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
        end,
        mode = { "n", "x", "o" },
        desc = "Treesitter: Repeat last move next",
      },
      {
        "|",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
        end,
        mode = { "n", "x", "o" },
        desc = "Treesitter: Repeat last move previous",
      },
    },
  },
}
