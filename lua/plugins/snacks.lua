return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        -- 针对查找文件 (Find Files)
        files = {
          hidden = true,
          ignored = true,
        },
        -- 针对全局搜索 (Grep)
        grep = {
          hidden = true,
          ignored = true,
        },
        -- 如果你也使用 Snacks 的文件浏览器模块
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
