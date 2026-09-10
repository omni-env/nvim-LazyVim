-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 问题排查
-- vim.lsp.log.set_level "debug"

vim.opt.scrolloff = 2 -- 滚动时保持光标上下至少保留 2 行上下文
vim.opt.sidescrolloff = 8 -- 左右平移时保留 8 列上下文
vim.opt.fileformats = "unix,dos,mac" -- 优先使用 unix，其次支持 dos 和 macunix
vim.opt.timeoutlen = 666 -- 设置组合快捷键的等待超时时间

-- 显示空格、制表符等不可见字符
vim.opt.list = true
vim.opt.listchars = {
  -- tab = "» ", -- 显示制表符为 » 后跟一个空格
  tab = "··»", -- 避开与 snacks.nvim 缩进指示线的冲突
  trail = "·", -- 显示行尾空格为 ·
  nbsp = "␣", -- 显示不间断空格为 ␣
}

-- ===================================================================
-- 全局默认缩进配置（4 个空格）
-- ===================================================================
vim.opt.expandtab = true -- 按下 Tab 时自动转换为空格
vim.opt.tabstop = 4 -- 文件中的 Tab 字符在屏幕上显示的宽度
vim.opt.shiftwidth = 4 -- 每一级缩进（如语法缩进、按下 '>' / '<'）的空格数
vim.opt.softtabstop = 4 -- 插入模式下，按 Tab 或 Backspace 时增删的空格数

-- ===================================================================
-- 特定语言覆盖规则（2 个空格）
-- ===================================================================
vim.api.nvim_create_autocmd("FileType", {
  -- 创建专属 augroup，防止配置文件重复 source 时产生多重绑定
  group = vim.api.nvim_create_augroup("IndentOverrides", { clear = true }),
  -- 指定需要覆写为 2 个空格的文件类型
  pattern = {
    "lua",
    "vim",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "jsonnet",
    "yaml",
    "toml",
  },
  callback = function()
    -- 必须使用 opt_local，确保修改仅作用于当前 buffer，避免污染全局默认值
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
