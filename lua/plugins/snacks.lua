return {
  "folke/snacks.nvim",
  opts = {
    -- ==========================================
    -- 1. Notifier (通知系统)
    -- ==========================================
    notifier = {
      timeout = 10000, -- 普通通知的默认显示时长
    },

    -- ==========================================
    -- 2. Picker (多功能选择与展示面板)
    -- ==========================================
    picker = {
      sources = {
        -- 文件查找 (Find Files)
        files = {
          hidden = true, -- 包含隐藏文件（如 .config 等）
          ignored = true, -- 包含被 .gitignore 忽略的文件
        },

        -- 全局文本检索 (Live Grep)
        grep = {
          hidden = true,
          ignored = true,
        },

        -- 目录浏览器 (Explorer)
        explorer = {
          hidden = true,
          ignored = true,
        },

        -- 通知历史查看器 (Notification History)
        notifications = {
          -- 核心布局控制：尺寸与左右比例分配
          layout = {
            layout = {
              box = "horizontal", -- 根节点水平排列，切分左右两栏
              width = 0.85, -- 整体面板宽度占屏幕
              height = 0.80, -- 整体面板高度占屏幕

              -- 左侧区域（垂直盒子：包含输入框和列表）
              {
                box = "vertical",
                width = 0.35, -- 左侧区域占整体宽度的比例
                { win = "input", height = 1, border = "rounded" },
                { win = "list", border = "rounded" },
              },

              -- 右侧区域（预览窗口）
              {
                win = "preview",
                width = 0.65, -- 右侧预览区占整体宽度的比例
                border = "rounded",
              },
            },
          },
          -- 窗口局部属性控制
          win = {
            preview = {
              wo = {
                wrap = true, -- 开启预览窗口自动换行，防止长文本被截断
              },
            },
          },
        },
      },
    },
  },
}
