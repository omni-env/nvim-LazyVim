-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 导入键映射函数
local kmap = require("utils").kmap

-- kmap({'n', 'v'}, ';', ':', { desc = 'CMD enter command mode' })
kmap("i", "jj", "<ESC>", { desc = "Exit insert mode" })
kmap("i", "jk", "<ESC>", { desc = "Exit insert mode" })
-- 复制到行尾，与 C 和 D 保持统一
kmap("n", "Y", "y$", { desc = "Yank to end of line" })

-- 在当前行「下方」按行粘贴剪贴板内容，并自动调整缩进
kmap("n", "<leader>p", function()
  vim.cmd("put " .. vim.v.register)
  vim.cmd "normal! ='["
end, { desc = "Paste clipboard below (line-wise, adjust indent)" })
-- 在当前行「上方」粘贴
kmap("n", "<leader>P", function()
  vim.cmd("put! " .. vim.v.register)
  vim.cmd "normal! ='["
end, { desc = "Paste clipboard above (line-wise, adjust indent)" })

-- 按 Shift+Insert 粘贴系统剪贴板内容
kmap({ "n", "v" }, "<S-Insert>", '"+p', { desc = "Paste OS clipboard" })
kmap({ "i", "c" }, "<S-Insert>", "<C-r>+", { desc = "Paste OS clipboard" })
