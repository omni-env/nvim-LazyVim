return {
  { "kepano/flexoki-neovim", name = "flexoki", lazy = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flexoki-light",
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false, -- 建议在启动时加载，以便立刻匹配当前系统主题
    opts = {
      update_interval = 3000, -- 检查系统主题的频率（毫秒）
      set_dark_mode = function()
        -- 当前已经是暗色主题则不需修改直接返回
        if vim.o.background == "dark" then
          return
        end
        -- 当系统切换为暗色主题时执行的操作
        vim.api.nvim_set_option_value("background", "dark", {})
        -- LazyVim 默认使用 tokyonight，你可以根据需要切换为你安装的主题
        vim.cmd("colorscheme catppuccin-mocha")
      end,
      set_light_mode = function()
        -- 当前已经是亮色色主题则不需修改直接返回
        if vim.o.background == "light" then
          return
        end
        -- 当系统切换为亮色主题时执行的操作
        vim.api.nvim_set_option_value("background", "light", {})
        -- 切换为亮色版本的主题
        vim.cmd("colorscheme flexoki-light")
      end,
    },
  },
}
