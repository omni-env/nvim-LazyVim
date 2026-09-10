return {
  "gbprod/substitute.nvim",
  -- 空 opts：触发 lazy.nvim 自动调用 setup()，以应用插件默认配置
  opts = {},
  -- 推荐使用 keys 属性进行完全的按键懒加载，保证 Neovim 启动速度
  keys = {
    -- -------------------------------------------------------------------
    -- 1. Substitute (文本替换) 模块，映射为 gs 族
    -- -------------------------------------------------------------------
    {
      "gs",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute with motion",
    },
    {
      "gss",
      function()
        require("substitute").line()
      end,
      mode = "n",
      desc = "Substitute line",
    },
    {
      "gS",
      function()
        require("substitute").eol()
      end,
      mode = "n",
      desc = "Substitute to end of line",
    },
    {
      "gs",
      function()
        require("substitute").visual()
      end,
      mode = "x",
      desc = "Substitute in visual mode",
    },

    -- -------------------------------------------------------------------
    -- 2. Exchange (文本交换) 模块，保留标准的 cx 族
    -- -------------------------------------------------------------------
    {
      "cx",
      function()
        require("substitute.exchange").operator()
      end,
      mode = "n",
      desc = "Exchange with motion",
    },
    {
      "cxx",
      function()
        require("substitute.exchange").line()
      end,
      mode = "n",
      desc = "Exchange line",
    },
    {
      "cxc",
      function()
        require("substitute.exchange").cancel()
      end,
      mode = "n",
      desc = "Cancel exchange",
    },
    {
      "cX",
      function()
        require("substitute.exchange").visual()
      end,
      mode = "x",
      desc = "Exchange in visual mode",
    },
  },
}
