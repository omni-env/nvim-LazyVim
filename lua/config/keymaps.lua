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

-- 将 <Leader>o 映射为从系统剪贴板粘贴（到新行里）
kmap("n", "<leader>o", ":put +<CR>", { desc = "Paste clipboard below (as new line)" })
kmap("n", "<leader>O", ":put! +<CR>", { desc = "Paste clipboard above (as new line)" })

-- 按 Shift+Insert 粘贴系统剪贴板内容
kmap({ "n", "v" }, "<S-Insert>", '"+p', { desc = "Paste from system clipboard" })
kmap({ "i", "c" }, "<S-Insert>", "<C-r>+", { desc = "Paste from system clipboard" })
