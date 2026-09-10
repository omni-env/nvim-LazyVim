-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 优先使用 unix，其次支持 dos 和 macunix
vim.opt.fileformats = "unix,dos,mac"

-- 显示空格、制表符等不可见字符
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ", -- 显示制表符为 » 后跟一个空格
  trail = "·", -- 显示行尾空格为 ·
  nbsp = "␣", -- 显示不间断空格为 ␣
}

-- 问题排查
-- vim.lsp.log.set_level "debug"
